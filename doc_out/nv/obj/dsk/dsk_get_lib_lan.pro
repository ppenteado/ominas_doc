;=============================================================================
;+
; NAME:
;	dsk_get_lib_lan
;
;
; PURPOSE:
;	Determines lib_lan for each given disk descriptor, based on the
;	orientation of its BODY axes.
;
;
; CATEGORY:
;	NV/LIB/DSK
;
;
; CALLING SEQUENCE:
;	lib_lan = dsk_lib_lan(dkd, frame_bd)
;
;
; ARGUMENTS:
;  INPUT: NONE
;	dkd:	 Array (nt) of any subclass of DISK.
;
;	frame_bd:	Subclass of BODY giving the frame against which to 
;			measure inclinations and nodes, e.g., a planet 
;			descriptor.  One for each dkd.
;
;  OUTPUT: NONE
;
;
; KEYWORDS:
;  INPUT: 
;
;  OUTPUT: NONE
;
;
; RETURN:
;	lib_lan value associated with each given disk descriptor.
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
function dsk_get_lib_lan, dkd, frame_bd
@core.include
 

 if(NOT keyword_set(frame_bd)) then nv_message, 'frame_bd required.'


 lib_lan = orb_get_lib_lan(dkd, frame_bd)

 return, lib_lan
end
;===========================================================================
