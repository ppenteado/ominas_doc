;=============================================================================
;+
; NAME:
;	cor_evolve
;
;
; PURPOSE:
;	Calls the 'evolve' method appropriate for the given descriptor.
;
;
; CATEGORY:
;	NV/SYS/COR
;
;
; CALLING SEQUENCE:
;	xdt = cor_evolve(xd, dt)
;
;
; ARGUMENTS:
;  INPUT:
;	xd:	 Any subclass of BODY.
;
;	dt:	 Time offset.
;
;  OUTPUT: NONE
;
;
; KEYWORDS:
;  INPUT: 
;	nodv:	 If set, velocities will not be evolved.
;
;	copy:	If set, the evolved descriptor is copied into the input
;		descriptor and it is freed.  The input descriptor is returned.
;
;  OUTPUT: NONE
;
;
; RETURN:
;	Array (nxd,ndt) of newly allocated descriptors, of the same class 
;	as xd, evolved by time dt, where nxd is the number of xd, and ndt
;	is the number of dt.
;
;
; STATUS:
;	Complete
;
;
; MODIFICATION HISTORY:
; 	Written by:	Spitale
;	
;-
;=============================================================================
function cor_evolve, xd, dt, nodv=nodv, copy=copy

 abbrev = cor_abbrev(xd[0])
 fn = abbrev + '_EVOLVE'

 return, call_function(fn, xd, dt, nodv=nodv, copy=copy)
end
;===========================================================================



