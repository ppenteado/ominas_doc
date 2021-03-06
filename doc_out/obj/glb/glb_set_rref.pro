;===========================================================================
;+
; NAME:
;	glb_set_rref
;
;
; PURPOSE:
;       Replaces the reference radius for each given globe descriptor.
;
;
; CATEGORY:
;	NV/LIB/GLB
;
;
; CALLING SEQUENCE:
;	glb_set_rref, gbd, rref
;
;
; ARGUMENTS:
;  INPUT: 
;	gbd:	 Array (nt) of any subclass of GLOBE descriptors.
;
;	rref:	 String array (nt) of new reference radii.
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
pro glb_set_rref, gbd, rref, noevent=noevent
@core.include
 
 _gbd = cor_dereference(gbd)

 _gbd.rref = rref

 cor_rereference, gbd, _gbd
 nv_notify, gbd, type = 0, noevent=noevent
end
;===========================================================================
