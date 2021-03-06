;=============================================================================
;+
; NAME:
;       image_to_inertial
;
;
; PURPOSE:
;       Transforms points in image coordinates to unit vectors with 
;	inertial coordinates.
;
;
; CATEGORY:
;       NV/LIB/TOOLS/COMPOSITE
;
;
; CALLING SEQUENCE:
;       result = image_to_inertial(cd, p)
;
;
; ARGUMENTS:
;  INPUT:
;	cd:	Array of nt camera descriptors.
;
;	p:	Array (2 x nv x nt) of image points.
;
;  OUTPUT:
;       NONE
;
; RETURN:
;       Array (nv x 3 x nt) of of inertial unit vectors.
;
; STATUS:
;       Completed.
;
;
; MODIFICATION HISTORY:
;       Written by:     Spitale 4/2003
;-
;=============================================================================
function image_to_inertial, cd, p

  return, bod_body_to_inertial(cd, $
	       cam_focal_to_body(cd, $
	         cam_image_to_focal(cd, p)))
end
;==========================================================================
