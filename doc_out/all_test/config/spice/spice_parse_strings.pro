;===========================================================================
; spice_parse_strings
;
;===========================================================================
function spice_parse_strings, s

 ss = string(s)  
; strings = strsplit(ss, ';', /extract)
 strings = str_nsplit(ss, ';')

 return, strings
end
;===========================================================================
