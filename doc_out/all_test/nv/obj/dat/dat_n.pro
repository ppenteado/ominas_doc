;=============================================================================
;+
; NAME:
;	dat_n
;
;
; PURPOSE:
;	Returns the number of elements in the data array in the given data 
;	descriptor.
;
;
; CATEGORY:
;	NV/SYS
;
;
; CALLING SEQUENCE:
;	dim = dat_n(dd)
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
;  INPUT: 
;	true:	If set, the dimension function is not called and the true
;	 	length of the data is returned.
;
;  OUTPUT: NONE
;
;
; RETURN: 
;	Number of elements in the data in the data descriptor.
;
;
; STATUS:
;	Complete
;
;
; MODIFICATION HISTORY:
; 	Written by:	Spitale, 6/2017
;	
;-
;=============================================================================
function dat_n, dd, true=true, noevent=noevent
@core.include

 dim = dat_dim(dd, true=true, noevent=noevent)

 n = 1
 for i=0, n_elements(dim)-1 do n = n * dim[i]

 return, n
end
;=============================================================================
