;=============================================================================
;+
; NAME:
;	pg_load_maps
;
;
; PURPOSE:
;	Loads maps and descriptors from a map directory.
;
;
; CATEGORY:
;	NV/PG
;
;
; CALLING SEQUENCE:
;	ddmap = pg_load_maps(md=md)
;
;
; ARGUMENTS:
;  INPUT: 
;	dir :   Top directory for map library.  If not set, the directory
;		is obtained from the PG_MAPS environment varable.
;
;  OUTPUT: NONE
;
;
; KEYWORDS:
;  INPUT: NONE
;
;
;  OUTPUT: 
;	md:	Map descriptor for each map.
;
;
; RETURN: 
;	Data descriptor containing the rendered image.
;
;
; PROCEDURE:
;	
;
;
; EXAMPLE:
;
;
; STATUS:
;	Complete
;
;
; MODIFICATION HISTORY:
; 	Written by:	Spitale  7/2015
;	
;-
;=============================================================================
function pg_load_maps, dir, md=md, dd=dd

 ;--------------------------------------------------------------
 ; get map directory
 ;--------------------------------------------------------------
 if(NOT keyword_set(dir)) then dir = getenv('PG_MAPS')
 if(NOT keyword_set(dir)) then $
  begin
   nv_message, /con, name='pg_load_maps', 'Map directory not defined.'
   return, 0
  end 


 ;--------------------------------------------------------------
 ; get map files
 ;--------------------------------------------------------------
 files = file_search(dir + '/*/*.*')


 ;------------------------------------------------------------------
 ; load map files
 ;  The files are not actually loaded, as indicated by maintain=1.
 ;  They will be loaded when accessed.
 ;-----------------------------------------------------------------
 dd = dat_read(files, maintain=1)
 if(NOT keyword_set(dd)) then return, 0

 nmap = n_elements(dd)


 ;--------------------------------------------------------------
 ; get map descriptors
 ;--------------------------------------------------------------
 md = objarr(nmap)
 for i=0, nmap-1 do md[i] = pg_get_maps(dd[i])

 w = where(obj_valid(md))
 if(w[0] EQ -1) then return, 0


 md = md[w]
 return, dd[w]
end
;=============================================================================
