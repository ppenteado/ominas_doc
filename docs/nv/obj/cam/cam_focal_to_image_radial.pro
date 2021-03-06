;===========================================================================
;+
; NAME:
;	cam_focal_to_image_radial
;
;
; PURPOSE:
;       Transforms the given array of points in the focal plane
;       coordinate system to an array of points in the image
;       coordinate system using a radial distortion model.
;
;
; CATEGORY:
;	NV/LIB/CAM
;
;
; CALLING SEQUENCE:
;	image_pts = cam_focal_to_image_radial(cd, focal_pts)
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
;	**Incomplete
;
;
; MODIFICATION HISTORY:
; 	Written by:	Spitale, 1/1998
; 	Adapted by:	Spitale, 5/2016
;	
;-
;===========================================================================
function cam_focal_to_image_radial, cd, v
@core.include
end
;===========================================================================



