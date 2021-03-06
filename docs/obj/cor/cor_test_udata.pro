;=============================================================================
;+
; NAME:
;	cor_test_udata
;
;
; PURPOSE:
;	Tests the existence of data stored in a descriptor under the 
;	specified name.
;
;
; CATEGORY:
;	NV/LIB/COR
;
;
; CALLING SEQUENCE:
;	data = cor_test_udata(crx, name)
;
;
; ARGUMENTS:
;  INPUT:
;	crx:	 Any subclass of CORE.  Only one descriptor may be provided.
;
;	name:	 Name associated with the data to test.
;
;  OUTPUT: NONE
;
;
; KEYWORDS:
;  INPUT:  NONE
;
;  OUTPUT: NONE
;
;
; RETURN:
;	True if the data is stored under the given name, false otherwise.
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
function cor_test_udata, crd, name, noevent=noevent
@core.include
 nv_notify, crd, type = 1, noevent=noevent
 _crd = cor_dereference(crd)

 if(NOT ptr_valid(_crd.udata_tlp)) then return, 0
 return, (tag_list_match(_crd.udata_tlp, name) NE -1)[0]
end
;=============================================================================
