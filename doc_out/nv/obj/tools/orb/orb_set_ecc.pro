;===========================================================================
; orb_set_ecc
;
;
;===========================================================================
pro orb_set_ecc, xd, _ecc, junk
 ecc = dsk_ecc(xd)
 ecc[0,0,*] = _ecc
 dsk_set_ecc, xd, ecc
end
;===========================================================================
