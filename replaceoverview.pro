pro replaceoverview,source1,source2,old
compile_opt idl2,logical_predicate
ls=strarr(file_lines(source1))
openr,lun,source1,/get_lun
readf,lun,ls
free_lun,lun
ld=strarr(file_lines(source2))
openr,lun,source2,/get_lun
readf,lun,ld
free_lun,lun

send=where(stregex(ls,'<div class="footer">',/boolean))
sstart=where(stregex(ls,'<div class="content">',/boolean))

ldo=[ls[0:sstart],ld,ls[send:-1]]

file_copy,source1,old,/verbose,/overwrite

openw,lun,source1,/get_lun
printf,lun,ldo,format='(A0)'
free_lun,lun

end
