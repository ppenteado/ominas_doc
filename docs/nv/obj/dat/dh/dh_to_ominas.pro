;===========================================================================
; dh_to_ominas
;
;===========================================================================
function dh_to_ominas, format, value
 name = strlowcase(format) + '_to_ominas'
 return, call_function(name, value)
end
;===========================================================================
