pro ominas_rst_trans,filein,fileout
compile_opt idl2,logical_predicate
linesin=pp_readtxt(filein)


;find comment blocks
wst=where(stregex(linesin,'^;\+$',/boolean),cwst)
wen=where(stregex(linesin,'^;-$',/boolean),cwen)

;identify all comment blocks
blocks=list()
inblock=lonarr(n_elements(linesin))-1
cb=0
for ib=0,min([cwst,cwen]-1) do begin
  en=wen[ib]
  st=wst[ib]
  nl=en-st+1
  if total(stregex(linesin[st:en],'^;',/boolean),/integer) eq nl then begin
    ;only select blocks that do not start with an RST title
    w=where(~stregex(linesin[st:en],'^;$',/boolean),wc)
    ti=(linesin[st:en])[w[1]]
    un=(linesin[st:en])[w[2]]
    sti=stregex(ti,'^;[[:blank:]]*([[:graph:]]+)',/subexpr,/extract)
    sun=stregex(un,'^;[[:blank:]]*((=+)|(-+)|(~+))',/subexpr,/extract)
    if strlen(sti[1]) ne strlen(sun[1]) then begin
      blocks.add,{ind:cb,st:st,en:en,lines:linesin[st:en]}
      inblock[st:en]=cb
      cb++
    endif
  endif
endfor

;parse all input lines

linesout=list()
blocksused=hash()
headerblocks=hash()
foreach line,linesin,iline do begin
  if inblock[iline] lt 0 then linesout.add,line else begin
    rstblock=list()
    rstblock.add,';+'
    rstblock.add,';'
    
    block=blocks[inblock[iline]]
    lines=block.lines
    ;parse input block
    w=[where(stregex(lines,';[[:blank:]]*([[:upper:] ]+):',/boolean),wc),-1]
    els=hash()
    foreach ww,w[0:-2],iw do begin
      bl=lines[ww:w[iw+1]-1]
      typ=stregex(bl[0],'(;[[:blank:]]*)([[:upper:] ]+):',/subexpr,/extract)
      ;nbl=stregex(bl[1:-2],';[[:blank:]]{'+strtrim(strlen(typ[1])-1,2)+'}([[:print:]]*)',/subexpr,/extract)
      nbl=stregex(bl[1:-2],';[[:blank:]]*(.*)',/subexpr,/extract)
      nbl=nbl[1,*]
      nbl=nbl[where(strlen(strtrim(nbl,2)))]
      els[strupcase(typ[-1])]=nbl
    endforeach
    if els.haskey('PURPOSE') then begin
      rstblock.add,'; :Description:'
      rstblock.add,';   '+els['PURPOSE'],/extract
      rstblock.add,';'
    endif
    if els.haskey('CATEGORY') then begin
      rstblock.add,'; :Categories: '
      rstblock.add,';   '+els['CATEGORY'],/extract
      rstblock.add,';'
    endif
    if els.haskey('MODIFICATION HISTORY') then begin
      rstblock.add,'; :History:'
      rstblock.add,';   '+els['MODIFICATION HISTORY'],/extract
      rstblock.add,';'
    endif
    rstblock.add,';'
    rstblock.add,';-'
    ;linesout.add,rstblock.toarray(),/extract
    if els.haskey('NAME') then headerblocks[els['NAME',0]]=rstblock.toarray()
    iline=block.en
  endelse
endforeach

linesout=linesout.toarray()
lout=list()

w=where(stregex(linesout,'^((pro)|(function))([[:blank:]]+)([^,]+)',/boolean))
foreach line,linesout do begin
  if stregex(line,'^((pro)|(function))([[:blank:]]+)([^,]+)',/boolean) then begin
    nam=(stregex(line,'^((pro)|(function))([[:blank:]]+)([^,]+)',/extract,/subexpr))[-1]
    nam=strlowcase(nam)
    if headerblocks.haskey(nam) then lout.add,headerblocks[nam],/extract 
    lout.add,line
  endif else lout.add,line
endforeach
lout=lout.toarray()

openw,lun,fileout,/get_lun
printf,lun,lout,format='(A0)'
free_lun,lun
end
