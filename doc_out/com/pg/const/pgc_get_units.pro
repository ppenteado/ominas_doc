;============================================================================
; pgc_get_units
;
;============================================================================
function pgc_get_units
@pgc_block.common

 ;----------------------------------------------------
 ; common block (from pgs_set_units) takes precedence
 ;----------------------------------------------------
 if(keyword_set(units)) then return, units 

 ;----------------------------------------------------
 ; environment PGC_UNITS is next
 ;----------------------------------------------------
 units = strlowcase(getenv('PGC_UNITS'))
 if(keyword_set(units)) then return, units 

 ;----------------------------------------------------
 ; default to 'mks'
 ;----------------------------------------------------
 return, 'mks'
end
;============================================================================
