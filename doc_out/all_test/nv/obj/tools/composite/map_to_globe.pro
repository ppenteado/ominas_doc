;=============================================================================
;+
; NAME:
;       map_to_globe
;
;
; PURPOSE:
;       Transforms points in map coordinates to surface coordinates.
;
;
; CATEGORY:
;       NV/LIB/TOOLS/COMPOSITE
;
;
; CALLING SEQUENCE:
;       result = map_to_globe(md, gbx, map_pts)
;
;
; ARGUMENTS:
;  INPUT:
;	md:	Array of nt map descriptors.
;
;	gbx:	Array of nt globe descriptors.
;
;	map_pts:	Array (2 x nv x nt) of map points
;
;  OUTPUT:
;       NONE
;
; KEYWORDS:
;   INPUT: NONE
;
;   OUTPUT: NONE
;
;
; RETURN:
;       Array (nv x 3 x nt) of globe coordinates, with the altitude coordinate set to
;	zero.
;
; STATUS:
;       Completed.
;
;
; MODIFICATION HISTORY:
;       Written by:     Spitale
;-
;=============================================================================
function map_to_globe, md, gbx, map_pts
 return, map_to_surface(md, gbx, map_pts)
end
;===========================================================================
