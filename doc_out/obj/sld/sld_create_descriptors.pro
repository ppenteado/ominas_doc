;=============================================================================
;+
; NAME:
;	sld_create_descriptors
;
;
; PURPOSE:
;	Init method for the SOLID class.
;
;
; CATEGORY:
;	NV/LIB/SLD
;
;
; CALLING SEQUENCE:
;	sld = sld_create_descriptors(n)
;
;
; ARGUMENTS:
;  INPUT:
;	n:	Number of descriptors to create.
;
;  OUTPUT: NONE
;
;
; KEYWORDS (in addition to those accepted by all superclasses):
;  INPUT:  
;	sld:	Globe descriptor(s) to initialize, instead of creating a new one.
;
;	bd:	Body descriptor(s) instead of using bod_create_descriptors.
;
;	crd:	Core descriptor(s) instead of using cor_create_descriptors.
;
;	opacity: Array (n) of opacities for each body.
;
;	GM:	Array (n) of masses x gravitiational constant.
;
;	mass:	Array (n) of masses.
;
;	phase_fn: Array (n) of phase function names.
;
;	phase_parm:	Array (npht,n) of phase function parameters.
;
;	refl_fn: Array (n) of reflection function names.
;
;	refl_parm:	Array (npht,n) of reflection function parameters.
;
;	albedo:	Array (n) of bond albedos.
;
;
;  OUTPUT: NONE
;
;
; RETURN:
;	Newly created or or freshly initialized solid descriptors, depending
;	on the presence of the bd keyword.
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
function sld_create_descriptors, n, crd=crd0, bd=bd0, sld=sld0, $
@sld__keywords.include
end_keywords
@core.include
 if(NOT keyword_set(n)) then n = 1


 sld = objarr(n)
 for i=0, n-1 do $
  begin

   sld[i] = ominas_solid(i, crd=crd0, bd=bd0, sld=sld0, $
@sld__keywords.include
end_keywords)

  end


 return, sld
end
;===========================================================================



