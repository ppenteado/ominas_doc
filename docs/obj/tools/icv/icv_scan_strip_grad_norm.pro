;=============================================================================
;+
; NAME:
;	icv_scan_strip_grad_norm
;
;
; PURPOSE:
;	Calls icv_scan_strip_grad with /norm set.
;
;
; CATEGORY:
;	NV/LIB/TOOLS/ICV
;
;
; CALLING SEQUENCE:
;	result = icv_scan_strip_grad_norm(strip, model, szero, mzero)
;
;
; ARGUMENTS:
;  INPUT:
;	strip:	Image strip (n_points,ns) to be scanned.  Output from
;		icv_strip_curve ns must be even.
;
;	model:	Not used.
;
;	szero:	Zero-offset position in the strip.
;
;	mzero:	Not used.
;
;  OUTPUT: NONE
;
;
; KEYWORDS:
;  INPUT: NONE
;
;  OUTPUT:
;	cc:	Not used, hardwired to 0.9999999d.
;
;	sigma:	Offset uncertainty for each point on the curve, computed as
;		one half of the half-width of the gradient peak. 
;
;
; RETURN:
;	Offset of maximum gradient points at each point on the curve.
;
;
; STATUS:
;	Complete.
;
;
; MODIFICATION HISTORY:
; 	Written by:	Spitale
;	
;-
;=============================================================================
function icv_scan_strip_grad_norm, strip, model, szero, mzero, arg=inner, $
        cc=cc, sigma=sigma

 return, icv_scan_strip_grad(/norm, strip, model, szero, mzero, arg=inner, $
        cc=cc, sigma=sigma)

end
;=============================================================================
