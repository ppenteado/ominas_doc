;=============================================================================
;+
; NAME:
;	dsk_set_libal
;
;
; PURPOSE:
;	Replaces libal in each given disk descriptor.
;
;
; CATEGORY:
;	NV/LIB/DSK
;
;
; CALLING SEQUENCE:
;	dsk_set_libal, bx, libal
;
;
; ARGUMENTS:
;  INPUT: 
;	dkd:	 Array (nt) of any subclass of DISK.
;
;	libal:	 New libal value.
;
;  OUTPUT: NONE
;
;
; KEYWORDS:
;  INPUT: NONE
;
;  OUTPUT: NONE
;
;
; RETURN: NONE
;
;
; STATUS:
;	Complete
;
;
; MODIFICATION HISTORY:
; 	Written by:	Spitale, 1/1998
; 	Adapted by:	Spitale, 5/2016
;	
;-
;=============================================================================
pro dsk_set_libal, dkd, libal, noevent=noevent
@core.include
 
 _dkd = cor_dereference(dkd)

 _dkd.libal = libal

 cor_rereference, dkd, _dkd
 nv_notify, dkd, type = 0, noevent=noevent
end
;===========================================================================



