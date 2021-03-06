;===========================================================================
;+
; NAME:
;	stn_set_surface_pt
;
;
; PURPOSE:
;	Replaces the surface_pt vector in each given station descriptor.
;
;
; CATEGORY:
;	NV/LIB/STN
;
;
; CALLING SEQUENCE:
;	stn_set_surface_pt, std, surface_pt
;
;
; ARGUMENTS:
;  INPUT: 
;	std:	Array (nt) of STATION descriptors.
;
;	surface_pt:	Array (1,3,nt) of surface_pt vectors.
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
; 	Written by:	Spitale
; 	Adapted by:	Spitale, 5/2016
;	
;-
;===========================================================================
pro stn_set_surface_pt, std, surface_pt, noevent=noevent
@core.include

 _std = cor_dereference(std)

 _std.surface_pt=surface_pt

 cor_rereference, std, _std
 nv_notify, std, type = 0, noevent=noevent
end
;===========================================================================



