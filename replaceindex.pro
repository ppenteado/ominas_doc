pro replaceindex,source1,contents,emptyh,newindex
compile_opt idl2,logical_predicate

;replace overview with contents
ls=strarr(file_lines(source1))
openr,lun,source1,/get_lun
readf,lun,ls
free_lun,lun

w=where(stregex(ls,'overview.html',/boolean),/null,count)
if count then ls[w]=ls[w].replace('overview.html',contents)
;foreach l,w do begin
;  ls[l]=ls[l].replace('overview.html',contents)
;endforeach

w=where(stregex(ls,'empty.html',/boolean),/null,count)
if count then ls[w]=ls[w].replace('empty.html',file_basename(newindex))
;foreach l,w do begin
;  ls[l]=ls[l].replace('empty.html',file_basename(newindex))
;endforeach

openw,lun,source1,/get_lun
printf,lun,ls,format='(A0)'
free_lun,lun


;create table of contents based on empty html
h=strarr(file_lines(file_dirname(source1,/mark)+contents))
openr,lun,file_dirname(source1,/mark)+contents,/get_lun
readf,lun,h
free_lun,lun

;find table of contents

lh=strsplit(h,'>',/extract)
if isa(lh,'list') then begin
  h=lh.toarray(dim=1)
  h+='>'
endif else h=lh+'>'


wh1o=where(stregex(h,'<h1[^>]*>',/bool))
wh1c=where(stregex(h,'</h1[^>]*>',/bool))
h1segs=list()
foreach wo,wh1o,iwo do begin
  h1segs.add,strjoin(h[wo:wh1c[iwo]],'')
endforeach
h1segs=h1segs.toarray()
wtoc=where(stregex(h1segs,'TABLE OF CONTENTS',/fold_case,/boolean))
tocs=h[wh1o[wtoc[0]]:wh1o[wtoc[0]+1]-1]
wli=where(stregex(tocs,'<a[^>]* href="#[^"]*"[^>]*>',/bool))
foreach l,wli do begin
  se=stregex(tocs[l],'(.*)href="#([^"]+)"(.*)',/extract,/subexpr)
  tocs[l]=se[1]+'target="main_frame" href='+contents+"#"+se[2]+se[3]
endforeach

;read empty html, fill its body and save it to newindex
eh=strarr(file_lines(emptyh))
openr,lun,emptyh,/get_lun
readf,lun,eh
free_lun,lun

wbo=where(stregex(eh,'<body[^>]*>',/bool))
wbc=where(stregex(eh,'</body[^>]*>',/bool))

if wbo[0] eq wbc[0] then begin
  neh=[eh[0:wbo[0]-1],'<body>',tocs,'</body>',eh[wbc[0]+1:-1]]
endif else neh=[eh[0:wbo[0]],tocs,eh[wbc[0]:-1]]

openw,lun,newindex,/get_lun
printf,lun,neh,format='(A0)'
free_lun,lun

end
