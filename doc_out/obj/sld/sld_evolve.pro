;===========================================================================
;+
; NAME:
;	sld_evolve
;
;
; PURPOSE:
;       Computes new solid descriptors at the given time offsets from
;       the given solid descriptors using the taylor series expansion
;       corresponding to the derivatives contained in the given solid
;       descriptor.
;
;
; CATEGORY:
;	NV/LIB/SLD
;
;
; CALLING SEQUENCE:
;	sldt = sld_evolve(sld, dt)
;
;
; ARGUMENTS:
;  INPUT: 
;	sld:	 Array (nsld) of any subclass of SOLID descriptors.
;
;	dt:	 Array (ndt) of time offsets.
;
;  OUTPUT: NONE
;
;
; KEYWORDS:
;  INPUT: 
;	nodv:	 If set, velocities will not be evolved.
;
;
;  OUTPUT: NONE
;
;
; RETURN:
;       Array (ngd,ndt) of newly allocated solid descriptors evolved
;       by time dt, where ngd is the number of sld, and ndt is the
;       number of dt.
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
function sld_evolve, sld, dt, nodv=nodv
@core.include
 return, bod_evolve(sld, dt, nodv=nodv)
end
;===========================================================================
