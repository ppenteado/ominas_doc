;=============================================================================
; switch
;
;
;=============================================================================
function switch, test, val1, val2
 if(test) then return, val1
 return, val2
end
;=============================================================================
