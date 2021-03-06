;===========================================================================
;+
; NAME:
;	sld_set_refl_parm
;
;
; PURPOSE:
;       Replaces the reflection function parameters for each given solid 
;	descriptor.
;
;
; CATEGORY:
;	NV/LIB/SLD
;
;
; CALLING SEQUENCE:
;	sld_set_refl_parm, sld, refl_parm
;
;
; ARGUMENTS:
;  INPUT: 
;	sld:		Array (nt) of any subclass of SOLID descriptors.
;
;	refl_parm:	Array (nt) of new reflection function parameters.
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
; 	Written by:	Spitale, 3/2017
;	
;-
;===========================================================================
pro sld_set_refl_parm, sld, refl_parm, noevent=noevent
@core.include

 _sld = cor_dereference(sld)

 _sld.refl_parm=refl_parm

 cor_rereference, sld, _sld
 nv_notify, sld, type = 0, noevent=noevent
end
;===========================================================================
