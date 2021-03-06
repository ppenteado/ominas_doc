;=============================================================================
;+
; NAME:
;       set_image_origin
;
;
; PURPOSE:
;	Sets the origin of a map or camera image.
;
;
; CATEGORY:
;       NV/LIB/TOOLS/COMPOSITE
;
;
; CALLING SEQUENCE:
;       set_image_origin, xd, origin
;
;
; ARGUMENTS:
;  INPUT:
;	xd:      Camera or map descriptor
;
;	origin: origin argument as in map_set_origin
;
;
;  OUTPUT: NONE
;
;
; KEYWORDS:
;   INPUT: NONE
;
;   OUTPUT: NONE
;
;
; RETURN: 
;	NONE.
;
;
; STATUS:
;       Completed.
;
;
; MODIFICATION HISTORY:
;       Written by:     Spitale
;-
;=============================================================================
pro set_image_origin, cd, origin

 class = (cor_class(cd))[0]

 case class of 
  'MAP' : map_set_origin, cd, origin
  'CAMERA' : cam_set_oaxis, cd, origin
  default :
 endcase
end
;=============================================================================
