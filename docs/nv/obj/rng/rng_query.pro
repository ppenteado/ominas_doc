;=============================================================================
;+
; NAME:
;	rng_query
;
;
; PURPOSE:
;	Returns the fields associated with a RING object.  This is a 
;	convenient way of getting multiple fields in one call, and only a 
;	single event is generated.
;
;
; CATEGORY:
;	NV/OBJ/RNG
;
;
; CALLING SEQUENCE:
;	rng_query, rd, <keywords>=<values>
;
;
; ARGUMENTS:
;  INPUT:
;	rd:	RING object.
;
;  OUTPUT: NONE
;
;
; KEYWORDS:
;  INPUT: 
;	<keywords>:	RING object fields to set.
;
;	condition:	Structure specifing a mask and a condition with which to
;			match flag values.  The structure must contain the fields
;			MASK and STATE.  MASK is a bitmask to test against
;			the flags field of the POINT object, and STATE
;			is either PS_TRUE and PS_FALSE.  Note that in this case, 
;			the values will be returned as a list, with no separation 
;			into nv and nt dimensions.
;
;	cat:		If set, arrays from mulitple input objets are 
;			concatenated.
;
;	<condition>:	All of the predefined conditions (e.g. /visible) are 
;			accepted; see pnt_condition_keywords.include.
;
;	noevent:	If set, no event is generated.
;
;  OUTPUT: NONE
;
;
; STATUS:
;	Complete
;
;
;
; MODIFICATION HISTORY:
; 	Written by:	Spitale, 2/2017
;	
;-
;=============================================================================
pro rng_query, xd, condition=condition, cat=cat, noevent=noevent, $
@rng__keywords.include
end_keywords

 nv_notify, xd, type = 1, noevent=noevent
 _xd = cor_dereference(xd)
_xd=xd

@rng_query.include

end
;===========================================================================
