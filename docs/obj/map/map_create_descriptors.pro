;=============================================================================
;+
; NAME:
;	map_create_descriptors
;
;
; PURPOSE:
;	Init method for the MAP class.
;
;
; CATEGORY:
;	NV/LIB/DSK
;
;
; CALLING SEQUENCE:
;	md = map_create_descriptors(n)
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
;	md:	Map descriptor(s) to initialize, instead of creating a new one.
;
;	crd:	Core descriptor(s) to pass to cor_create_descriptors.
;
;	type:	Array (1 x n) of strings giving the map types.
;
;	units:	Array (2 x n) giving the map units.
;
;	size:	Array (2 x n) giving the map sizes.
;
;	scale:	Array (1 x n) giving the map scales.
;
;	center:	Array (2 x n) giving the map centers.
;
;	range:	Array (2x2 x n) giving the map centers.
;
;	origin:	Array (2 x n) giving the map origins.
;
;	rotate:	Array (1 x n) giving the map rotate codes.
;
;	graphic: Array (1 x n) giving the map graphic flags.
;
;	radii:	Array (3 x n) giving the map ellipsoid radii.
;
;	radii:	Array (1 x n) of pointers giving the map functon data.
;
;
;  OUTPUT: NONE
;
;
; RETURN:
;	Newly created or or freshly initialized disk descriptors, depending
;	on the presence of the dkd keyword.
;
;
; STATUS:
;	Complete
;
;
; MODIFICATION HISTORY:
; 	Written by:	Spitale, 1/1998
;	
;-
;=============================================================================
function map_create_descriptors, n, crd=crd0, md=md0, $
@map__keywords.include
end_keywords
 if(NOT keyword_set(n)) then n = 1

 md = objarr(n)
 for i=0, n-1 do $
  begin

   md[i] = ominas_map(i, crd=crd0, md=md0, $
@map__keywords.include
end_keywords)

  end


 return, md
end
;===========================================================================
