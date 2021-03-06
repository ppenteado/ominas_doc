;===============================================================================
; strcat_common_input
;
;
;===============================================================================
function strcat_common_input, dd, keyword, values=values, status=status, $
@nv_trs_keywords_include.pro
@nv_trs_keywords1_include.pro
	end_keywords

 status = -1
 if(keyword NE 'STR_DESCRIPTORS') then return, ''


 ;---------------------------------------------------------
 ; identify any prior values that are star descriptors
 ;---------------------------------------------------------
 if(NOT keyword_set(values)) then return, ''
 if(size(values, /type) NE 11) then return, ''
 xd = values

 w = where(cor_class(xd) EQ 'STAR')
 if(w[0] EQ -1) then return, ''
 sd = xd[w]
 nsd = n_elements(sd)


 ;---------------------------------------------------------
 ; Find proper names. Star names are found via an 
 ; internal document that is cross indexed with several 
 ; catalogs. 
 ;---------------------------------------------------------

 ;- - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 ; find and read proper-name file
 ;- - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 file = file_search(getenv('OMINAS_DIR')+'/config/strcat/stars.txt')
 linarr = read_txt_table(file, delim='|', /raw, /all)
 table_cat = strtrim(linarr[0,*], 2)
 linarr = linarr[1:*,*]
 
 proper = strtrim(linarr[*,0],2)
 bayer = strtrim(linarr[*,1],2)


 ;- - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 ; match catalog names and numbers 
 ;- - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 name = cor_name(sd)
 cat = str_nnsplit(name, ' ', rem=num)
 num = strtrim(num,2)

 ucat = unique(cat)
 for i=0, n_elements(ucat)-1 do $
  begin
   ii = where(cat EQ ucat[i])
   nii = n_elements(ii)

   col = where(table_cat EQ ucat[i])
   if(col[0] NE -1) then $
    begin
     nums = strtrim(linarr[*,col],2)
     for jj=0, nii-1 do $
      begin
       w = where(nums EQ num[ii[jj]])
       if(w[0] NE -1) then $
        begin
         if(bayer[w] NE '') then cor_set_name, sd[ii[jj]], strupcase(bayer[w])
         if(proper[w] NE '') then cor_set_name, sd[ii[jj]], $
                         cor_name(sd[ii[jj]]) + ' (' + strupcase(proper[w]) + ')'
        end
      end
    end
  end



 status = 0
 return, ''
end
;===============================================================================
