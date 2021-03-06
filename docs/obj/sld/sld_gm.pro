;===========================================================================
;+
; NAME:
;	sld_gm
;
;
; PURPOSE:
;       Returns the GM value for each given solid descriptor.
;
;
; CATEGORY:
;	NV/LIB/SLD
;
;
; CALLING SEQUENCE:
;	gm = sld_gm(sld)
;
;
; ARGUMENTS:
;  INPUT:
;	sld:	 Array (nt) of any subclass of SOLID descriptors.
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
;       Array (nt) of GM values associated with each given solid descriptor.
;
;
; STATUS:
;	Complete
;
;
; MODIFICATION HISTORY:
; 	Written by:	Spitale, 7/2015
; 	Adapted by:	Spitale, 5/2016
;	
;-
;===========================================================================
function sld_gm, sld, noevent=noevent
@core.include

 nv_notify, sld, type = 1, noevent=noevent
 _sld = cor_dereference(sld)

 return, _sld.GM
end
;===========================================================================
