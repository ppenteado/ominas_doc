;=======================================================================================
; dawn_spice_sct2et
;
;=======================================================================================
function dawn_spice_sct2et, dd, times
 return, spice_sct2et(times, -203l)
end
;=======================================================================================
