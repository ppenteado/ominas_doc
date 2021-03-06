;=============================================================================
;+
; NAME:
;	dat_dim_data
;
;
; PURPOSE:
;	Returns the dimension function associated with a data descriptor.
;
;
; CATEGORY:
;	NV/SYS
;
;
; CALLING SEQUENCE:
;	dim_data = dat_dim_data(dd)
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
;	The dim_data associated with the data descriptor.
;
;
; STATUS:
;	Complete
;
;
; SEE ALSO:
;	dat_set_dim_data
;
;
; MODIFICATION HISTORY:
; 	Written by:	Spitale, 7/2015
; 	Adapted by:	Spitale, 5/2016
;	
;-
;=============================================================================
function dat_dim_data, dd, noevent=noevent
@core.include
 return, cor_udata(dd, 'DAT_DIM_DATA', noevent=noevent)
end
;===========================================================================



