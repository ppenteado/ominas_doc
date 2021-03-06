pro ominas_icy_remove,all=all,orc=orc
compile_opt idl2,logical_predicate
path=getenv('IDL_PATH') ? getenv('IDL_PATH') : PREF_GET('IDL_PATH')
dps=strsplit(path,':',/extract)
if ~keyword_set(all) then begin
  w=where(stregex(dps,'\+?/.*/ominas_data/icy/lib/?',/bool),count,complement=wc,ncomplement=nwc)
  fpath='/ominas_data/icy/lib/?'
endif else begin
  w=where(stregex(dps,'\+?/.*/icy/lib/?',/bool),count,complement=wc,ncomplement=nwc)
  fpath='/icy/lib/?'
endelse
openw,lun,getenv('OMINAS_TMP')+'/idlpathr.sh',/get_lun
printf,lun,' '
free_lun,lun
if nwc then begin
  np=strjoin(dps[wc],':')
  print,'Setting IDL_PATH to ',np
  if getenv('IDL_PATH') then begin
    nl=file_lines(orc+'/idlpath.sh')
    if nl then begin
      pathr=strarr(nl)
      openr,lun,orc+'/idlpath.sh',/get_lun
      readf,lun,pathr
      free_lun,lun
    endif else pathr=['']
    pathr=pathr[where(~stregex(pathr,'[^#]*IDL_PATH=[^#]*'+fpath+'/?(:|$)',/bool),/null)]
    openw,lun,orc+'/idlpath.sh',/get_lun
    ;printf,lun,'export IDL_PATH="'+np+'"'
    printf,lun,pathr,format='(A0)'
    free_lun,lun
    print,'Icy path removed from IDL_PATH'
    setenv,'IDL_PATH='+np

    openw,lun,getenv('OMINAS_TMP')+'/idlpathr.sh',/append,/get_lun
    printf,lun,'export IDL_PATH="'+np+'"'
    free_lun,lun

  endif else begin
    pref_set,'IDL_PATH',np,/commit
    print,'Icy path removed from IDL preferences'
  endelse
endif
dlm_path=getenv('IDL_DLM_PATH') ? getenv('IDL_DLM_PATH') : PREF_GET('IDL_DLM_PATH')
dps=strsplit(dlm_path,':',/extract)
if ~keyword_set(all) then begin
  w=where(stregex(dps,'\+?/.*/ominas_data/icy/lib/?',/bool),count,complement=wc,ncomplement=nwc)
endif else begin
  w=where(stregex(dps,'\+?/.*/icy/lib/?',/bool),count,complement=wc,ncomplement=nwc)
endelse
if nwc then begin
  ndp=strjoin(dps[wc],':')
  print,'Setting IDL_DLM_PATH to ',ndp
  if getenv('IDL_DLM_PATH') then begin
    nl=file_lines(orc+'/idlpath.sh')
    if nl then begin
      pathr=strarr(nl)
      openr,lun,orc+'/idlpath.sh',/get_lun
      readf,lun,pathr
      free_lun,lun
    endif else pathr=['']
    pathr=pathr[where(~stregex(pathr,'[^#]*IDL_DLM_PATH=[^#]*'+fpath+'/?(:|$)',/bool),/null)]
    openw,lun,orc+'/idlpath.sh',/get_lun
    printf,lun,pathr,format='(A0)'
    ;printf,lun,'export IDL_DLM_PATH="'+ndp+'"'
    free_lun,lun
    print,'Icy path removed from IDL_DLM_PATH'
    setenv,'IDL_DLM_PATH='+ndp
    openw,lun,getenv('OMINAS_TMP')+'/idlpathr.sh',/append,/get_lun
    printf,lun,'export IDL_DLM_PATH="'+ndp+'"'
    free_lun,lun
  endif else begin
    pref_set,'IDL_DLM_PATH',ndp,/commit
    print,'Icy path removed from IDL DLM preferences'
  endelse
endif
exit
end
