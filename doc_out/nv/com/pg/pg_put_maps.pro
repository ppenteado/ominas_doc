;=============================================================================
;+
; NAME:
;	pg_put_maps
;
;
; PURPOSE:
;	Outputs map descriptors through the translators.
;
;
; CATEGORY:
;	NV/PG
;
;
; CALLING SEQUENCE:
;	pg_put_maps, dd, md=md
;
;
; ARGUMENTS:
;  INPUT:
;	dd:	Data descriptor.
;
;	trs:	String containing keywords and values to be passed directly
;		to the translators as if they appeared as arguments in the
;		translators table.  These arguments are passed to every
;		translator called, so the user should be aware of possible
;		conflicts.  Keywords passed using this mechanism take 
;		precedence over keywords appearing in the translators table.
;
;  OUTPUT:
;	NONE
;
;
; KEYWORDS:
;  INPUT:
;	md:	Map descriptors to output.
;
;	map_*:		All map override keywords are accepted.
;
;	tr_override:	String giving a comma-separated list of translators
;			to use instead of those in the translators table.  If
;			this keyword is specified, no translators from the 
;			table are called, but the translators keywords
;			from the table are still used.  
;
;  OUTPUT:
;	NONE
;
;
; SIDE EFFECTS:
;	Translator-dependent.  The data descriptor may be affected.
;
;
; PROCEDURE:
;	Map descriptors are passed to the translators.  Any map
;	keywords are used to override the corresponding quantities in the
;	output descriptors.
;
;
; STATUS:
;	Complete
;
;
; SEE ALSO:
;	pg_put_planets, pg_put_rings, pg_put_stars, pg_put_cameras
;
;
; MODIFICATION HISTORY:
; 	Written by:	Spitale, 1998
;	
;-
;=============================================================================
pro pg_put_maps, dd, trs, md=_md, $
@map__keywords.include
@nv_trs_keywords_include.pro
		end_keywords


 ;-------------------------------------------------------------------
 ; override the specified values 
 ;-------------------------------------------------------------------
 md = nv_clone(_md)

 if(defined(name)) then _name = name & name = !null
 map_assign, md, /noevent, $
@map__keywords.include
end_keywords
 if(defined(_name)) then name = _name


 ;-------------------------------
 ; put descriptor
 ;-------------------------------
 dat_put_value, dd, 'MAP_DESCRIPTORS', md, trs=trs, $
@nv_trs_keywords_include.pro
                             end_keywords

 nv_free, md
end
;===========================================================================



