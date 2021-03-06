;===========================================================================
;+
; NAME:
;	cam_focal_to_image_poly
;
;
; PURPOSE:
;       Transforms the given array of points in the focal plane
;       coordinate system to an array of points in the image
;       coordinate system using a polynomial distortion model.
;
; CATEGORY:
;	NV/LIB/CAM
;
;
; CALLING SEQUENCE:
;	image_pts = cam_focal_to_image_poly(cd, focal_pts)
;
;
; ARGUMENTS:
;  INPUT: 
;	cd:	        Array (nt) of CAMERA descriptors.
;
;	focal_pts:	Array (2,nv,nt) of points in the camera focal frame.
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
;       Array (2,nv,nt) of points in the image coordinate system.
;
;
; STATUS:
;	Complete
;
;
; MODIFICATION HISTORY:
; 	Written by:	Spitale, 1/1998
; 	Adapted by:	Spitale, 5/2016
;	
;-
;===========================================================================
function cam_focal_to_image_poly, cd, v
@core.include

 cam_get_poly_matrices, cd, XX, YY, PP, QQ

 return, poly_transform(XX, YY, double(v))
end
;===========================================================================



