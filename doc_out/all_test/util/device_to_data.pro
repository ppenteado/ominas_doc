;=============================================================================
; device_to_data
;
;=============================================================================
function device_to_data, p
 return, (convert_coord(/device, /to_data, double(p[0,*]), double(p[1,*])))[0:1,*]
end
;=============================================================================
