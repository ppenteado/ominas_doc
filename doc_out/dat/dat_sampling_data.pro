;=============================================================================
;+
; NAME:
;	dat_sampling_data
;
;
; PURPOSE:
;	Returns the sampling function associated with a data descriptor.
;
;
; CATEGORY:
;	NV/SYS
;
;
; CALLING SEQUENCE:
;	sampling_data = dat_sampling_data(dd)
;
;
; ARGUMENTS:
;  INPUT:
;	dd:	Data descriptor.
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
; RETURN:
;	The sampling_data associated with the data descriptor.
;
;
; STATUS:
;	Complete
;
;
; SEE ALSO:
;	dat_set_sampling_data
;
;
; MODIFICATION HISTORY:
; 	Written by:	Spitale, 7/2015
; 	Adapted by:	Spitale, 5/2016
;	
;-
;=============================================================================
function dat_sampling_data, dd, noevent=noevent
@core.include
 return, cor_udata(dd, 'DAT_SAMPLING_DATA', noevent=noevent)
end
;===========================================================================
