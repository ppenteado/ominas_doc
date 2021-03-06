;=============================================================================
;+
; NAME:
;	plt_replicate
;
;
; PURPOSE:
;	Replicates the given descriptor, producing an array of the given
;	dimensions containing cloned versions of the input descriptor.
;
;
; CATEGORY:
;	NV/LIB/PLT
;
;
; CALLING SEQUENCE:
;	pds = plt_replicate(pd, dim)
;
;
; ARGUMENTS:
;  INPUT:
;	pd:	 Planet descriptor.
;
;	dim:	 Dimensions of the result.
;
;  OUTPUT: NONE
;
;
; KEYWORDS:
;  INPUT:  NONE
;
;  OUTPUT: NONE
;
;
; RETURN:
;	Array of the given dimensions containing cloned versions of the input 
;	descriptor.
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
;=============================================================================
function plt_replicate, pd, dim
@core.include
 new_pd = dat_replicate(pd, dim, fn='nv_clone')
 return, new_pd
end
;==============================================================================
