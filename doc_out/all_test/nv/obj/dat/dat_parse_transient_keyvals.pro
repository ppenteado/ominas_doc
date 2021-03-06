;=============================================================================
;+
; NAME:
;	dat_parse_transient_keyvals
;
;
; PURPOSE:
;	Parses a comma-delimited transient argument string into an of array 
;	of strings containing keyword=value pairs.
;
;
; CATEGORY:
;	NV/SYS
;
;
; CALLING SEQUENCE:
;	keyvals = dat_parse_transient_keyvals(trs)
;
;
; ARGUMENTS:
;  INPUT:
;	trs:	Transient argument string.
;
;  OUTPUT:
;
;
; KEYWORDS:
;  INPUT: NONE
;
;  OUTPUT: NONE
;
;
; RETURN: 
;	Array of strings containing keyword=value pairs.
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
function dat_parse_transient_keyvals, trs
@core.include

 return, str_nsplit(trs, ',')

end
;===========================================================================
