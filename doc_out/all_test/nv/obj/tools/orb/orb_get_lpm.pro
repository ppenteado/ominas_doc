;============================================================================
; orb_get_lpm
;
;============================================================================
function orb_get_lpm, rd, pd0
 return, orb_anom_to_lon(rd, dsk_tapm(rd), pd0)
end
;============================================================================



