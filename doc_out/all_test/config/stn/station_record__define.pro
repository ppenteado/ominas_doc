;===========================================================================
; station_record__define
;
;
;===========================================================================
pro station_record__define

 nm = dsk_get_nm() + 1

 struct = $
    { station_record, $
	 name 		:	'', $
	 array_fname	:	'', $
	 lat 		:	0d, $
	 lon 		:	0d, $
	 alt 		:	0d $
    }

end
;===========================================================================

