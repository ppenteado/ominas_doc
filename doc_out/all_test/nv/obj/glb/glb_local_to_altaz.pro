;=============================================================================
;+
; NAME:
;	glb_local_to_altaz
;
; PURPOSE:
;       Converts the given column vectors from the local coordinate
;       system to the altaz coordinate system. 
;
;
; CATEGORY:
;	NV/LIB/GLB
;
;
; CALLING SEQUENCE:
;	altaz_dir = glb_local_to_altaz(gbd, surf_pts, local_dir)
;
;
; ARGUMENTS:
;  INPUT: 
;	gbd:	        Array (nt) of any subclass of GLOBE descriptors.
;
;	body_pts:	Array (nv,3,nt) of column vectors in the body
;                       frame (representing points on the surface of 
;                       the globe).
;
;       local_dir:      Array (3,nt) of column vectors in the local
;                       frame, giving the direction from each surf_pts.
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
;       Array (nv,3,nt) of column vectors in the altaz system.
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
;=============================================================================
function glb_local_to_altaz, gbd, v, _r
@core.include
 
 _gbd = cor_dereference(gbd)

 sv = size(v)
 nv = sv[1]
 nt = n_elements(_gbd)

 r = v_unit(_r, mag=mag)
 alt = asin(r[*,2,*])
 az = -atan(r[*,0,*], r[*,1,*])		; azimuth from north, increasing westward

 result = dblarr(nv,3,nt, /nozero)
 result[*,0,*] = alt
 result[*,1,*] = az
 result[*,2,*] = mag

 return, result
end
;=============================================================================
