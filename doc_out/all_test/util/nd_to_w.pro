;==============================================================================
; nd_to_w
;
;  p is [nd,n]
;
;==============================================================================
function nd_to_w, dim, p

 nd = (size(p, /dim))[0]

 w = 0
 for i=0, nd-1 do $
  begin
   x = p[i,*]
   if(i GT 0) then x = x*long(product(dim[0:i-1]))
   w = w + x
  end


 return, reform(round(w))
end
;==============================================================================



