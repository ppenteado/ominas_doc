;===========================================================================
; orb_get_ecc
;
;
;===========================================================================
function orb_get_ecc, xd, junk
 return, (dsk_ecc(xd))[0,0,*]
end
;===========================================================================
