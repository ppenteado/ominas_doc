;===========================================================================
;+
; NAME:
;	glb_set_lora
;
;
; PURPOSE:
;       Replaces the longitude of the first ellipsoid radius for each
;       given globe descriptor.
;
;
; CATEGORY:
;	NV/LIB/GLB
;
;
; CALLING SEQUENCE:
;	glb_set_lora, gbd, lora
;
;
; ARGUMENTS:
;  INPUT: 
;	gbd:	 Array (nt) of any subclass of GLOBE descriptors.
;
;	lora:	 Array (nt) of new longitude values of the first ellipsoid radius.
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
;===========================================================================
pro glb_set_lora, gbd, lora, noevent=noevent
 
 _gbd = cor_dereference(gbd)

 _gbd.lora=lora

 cor_rereference, gbd, _gbd
 nv_notify, gbd, type = 0, noevent=noevent
end
;===========================================================================
