;=============================================================================
;+
; NAME:
;	cam_set_fi_data
;
;
; PURPOSE:
;	Replaces the focal/image function data for a camera descriptor.
;
;
; CATEGORY:
;	NV/LIB/CAM
;
;
; CALLING SEQUENCE:
;	cam_set_fi_data, cd, data
;
;
; ARGUMENTS:
;  INPUT: 
;	cd:	 Camera descriptor.
;
;	data:	 New function data.
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
; 	Adapted by:	Spitale, 7/2016; adapted from cam_set_fi_data_p
;	
;-
;=============================================================================
pro cam_set_fi_data, cd, data, noevent=noevent
@core.include
 cor_set_udata, cd, 'CAM_FI_DATA', data, noevent=noevent
end
;===========================================================================
