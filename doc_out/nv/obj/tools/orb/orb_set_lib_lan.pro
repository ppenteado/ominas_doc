;===========================================================================
; orb_set_lib_lan
;
;===========================================================================
pro orb_set_lib_lan, xd, frame_bd, lib_lan
 _lib = bod_lib(xd)
 _lib[1,*] = lib

 bod_set_lib, xd, _lib
end
;===========================================================================
