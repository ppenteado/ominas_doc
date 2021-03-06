;=============================================================================
;+
; NAME:
;	plt_evolve
;
;
; PURPOSE:
;	Computes new planet descriptors at the given time offsets from the 
;	given planet descriptors using the taylor series expansion 
;	corresponding to the derivatives contained in the given planet 
;	descriptor.
;
;
; CATEGORY:
;	NV/LIB/PLT
;
;
; CALLING SEQUENCE:
;	pdt = plt_evolve(px, dt)
;
;
; ARGUMENTS:
;  INPUT: 
;	px:	 Any subclass of PLANET.
;
;	dt:	 Time offset.
;
;  OUTPUT: NONE
;
;
; KEYWORDS:
;  INPUT: 
;	nodv:	 If set, derivatives will not be evolved.
;
;
;  OUTPUT: NONE
;
;
; RETURN:
;	Array (npd,ndt) of newly allocated descriptors, of class PLANET,
;	evolved by time dt, where npd is the number of px, and ndt
;	is the number of dt.
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
function plt_evolve, pd, dt, nodv=nodv
@core.include
 return, glb_evolve(pd, dt, nodv=nodv)
end
;===========================================================================



