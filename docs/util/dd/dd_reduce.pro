;==============================================================================
; dd_reduce
;
;==============================================================================
function dd_reduce, aa

 dim = size([aa], /dim)
 ndim = n_elements(dim)

 a = total(aa, ndim)

 return, a
end
;==============================================================================
