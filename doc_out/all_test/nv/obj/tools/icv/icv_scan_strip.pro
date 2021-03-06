;=============================================================================
;+
; NAME:
;	icv_scan_strip
;
;
; PURPOSE:
;	At each point along an image strip, determines the point at which 
;	some criterion is optimized, depending on an externally-supplied
;	function.
;
;
; CATEGORY:
;	NV/LIB/TOOLS/ICV
;
;
; CALLING SEQUENCE:
;	result = icv_scan_strip(strip, model, szero, mzero, algorithm=algorithm)
;
;
; ARGUMENTS:
;  INPUT:
;	strip:	Image strip (n_points,ns) to be scanned.  Output from
;		icv_strip_curve ns must be even.
;
;	model:	Model (n_points,nm) to correlate with strip at each point 
;		on the curve.  Must have nm < ns.
;
;	szero:	Zero-offset position in the strip.
;
;	mzero:	Zero-offset position in the model.
;
;  OUTPUT: NONE
;
;
; KEYWORDS:
;  INPUT: NONE
;
;  OUTPUT:
;	cc:	Maximum correlation coefficient at each point on the curve.
;
;	sigma:	Offset uncertainty for each point on the curve, computed as
;		one half of the half-width of the correlation peak. 
;
;	algorithm:	String giving the subscript for the name of a 
;			function as icv_scan_strip_<algorithm>.  The algorithm
;			function should be structured like the present function,
;			except with no "algorithm" keyword.  Default is
;			'model'.
;
;
; RETURN:
;	Offset of best correlation at each point on the curve.
;
;
; PROCEDURE:
;	This program is a wrapper for a number of functions that use various
;	algorithms determined by the 'algorithm' keyword.
;
;
; STATUS:
;	Complete.
;
;
; MODIFICATION HISTORY:
; 	Written by:	Spitale, 2/1998
;	
;-
;=============================================================================
function icv_scan_strip, strip, model, szero, mzero, cc=cc, sigma=sigma, $
   algorithm=algorithm, arg=arg

 if(NOT keyword_set(algorithm)) then algorithm = 'MODEL'

 scan_offsets = call_function('icv_scan_strip_'+strlowcase(algorithm), $
          strip, model, szero, mzero, arg=arg, cc=cc, sigma=sigma)

;scan_offsets = scan_offsets - smooth(scan_offsets, 150)
 return, scan_offsets
end
;=============================================================================
