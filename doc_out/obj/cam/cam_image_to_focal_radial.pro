;===========================================================================
;+
; NAME:
;	cam_image_to_focal_radial
;
;
; PURPOSE:
;       Transforms the given array of points in the image coordinate
;       system to an array of points in the camera focal plane
;       coordinate system using a radial distortion model.
;
;
; CATEGORY:
;	NV/LIB/CAM
;
;
; CALLING SEQUENCE:
;	focal_pts = cam_image_to_focal_radial(cd, image_pts)
;
;
; ARGUMENTS:
;  INPUT: 
;	cd:	        Array (nt) of CAMERA descriptors.
;
;	image_pts:	Array (2,nv,nt) of points in the image coordinate system.
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
;       Array (2,nv,nt) of points in the camera focal frame.
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
function cam_image_to_focal_radial, cd, v
@core.include
end
;===========================================================================



