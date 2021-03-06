;==============================================================================
;+
; NAME:
;	glb_replicate
;
;
; PURPOSE:
;	Replicates the given globe descriptor, producing an array of the given
;	dimensions containing cloned versions of the input descriptor.
;
;
; CATEGORY:
;	NV/LIB/GLB
;
;
; CALLING SEQUENCE:
;	new_gbd = cam_replicate(gbd, dim)
;
;
; ARGUMENTS:
;  INPUT:
;	gbd:	 One descriptor of any subclass of GLOBE descriptor
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
;	globe descriptor.
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
;==============================================================================
function glb_replicate, gbd, dim
 new_gbd = dat_replicate(gbd, dim, fn='nv_clone')
 return, new_gbd
end
;==============================================================================
