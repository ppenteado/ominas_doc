;=================================================================================================
; planck_v
;
;=================================================================================================
function planck_v, h, c, k, v, T
; return, 2*h*c^2*v^3 / (exp(h*c*v/k/T) - 1d)
 return, 2d*h*v^3/c^2 / (exp(h*v/k/T) - 1d)
end
;=================================================================================================
