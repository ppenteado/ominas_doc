;=============================================================================
;+
; NAME:
;	sld_opacity
;
;
; PURPOSE:
;	Returns the opacity for each given solid descriptor.
;
;
; CATEGORY:
;	NV/LIB/SLD
;
;
; CALLING SEQUENCE:
;	opacity = sld_opacity(sld)
;
;
; ARGUMENTS:
;  INPUT: NONE
;	sld:	 Any subclass of SOLID.
;
;  OUTPUT: NONE
;
;
; KEYWORDS:
;  INPUT: 
;
;  OUTPUT: NONE
;
;
; RETURN:
;	Opacity value associated with each given solid descriptor.
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
;=============================================================================
function sld_opacity, sld, noevent=noevent
@core.include

 nv_notify, sld, type = 1, noevent=noevent
 _sld = cor_dereference(sld)
 return, _sld.opacity
end
;===========================================================================



