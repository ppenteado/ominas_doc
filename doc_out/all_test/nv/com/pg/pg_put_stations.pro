;=============================================================================
;+
; NAME:
;	pg_put_stations
;
;
; PURPOSE:
;	Outputs station descriptors through the translators.
;
;
; CATEGORY:
;	NV/PG
;
;
; CALLING SEQUENCE:
;	pg_put_stations, dd, std=std
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
;	std:	Star descriptors to output.
;
;	stn_*:		All star override keywords are accepted.
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
;	CameStarra descriptors are passed to the translators.  Any star
;	keywords are used to override the corresponding quantities in the
;	output descriptors.
;
;
; STATUS:
;	Complete
;
;
; SEE ALSO:
;	pg_put_planets, pg_put_rings, pg_put_cameras, pg_put_maps
;
;
; MODIFICATION HISTORY:
; 	Written by:	Spitale, 3/2017
;	
;-
;=============================================================================
pro pg_put_stations, dd, trs, std=_std, ods=ods, $
@stn__keywords.include
@nv_trs_keywords_include.pro
		end_keywords


 ;-------------------------------------------------------------------
 ; override the specified values (name cannot be overridden)
 ;-------------------------------------------------------------------
 std = nv_clone(_std)

 if(defined(name)) then _name = name & name = !null
 stn_assign, std, /noevent, $
@stn__keywords.include
end_keywords
 if(defined(_name)) then name = _name


 ;-------------------------------
 ; put descriptor
 ;-------------------------------
 dat_put_value, dd, 'STR_DESCRIPTORS', std, trs=trs, $
@nv_trs_keywords_include.pro
                             end_keywords


 nv_free, std
end
;===========================================================================



