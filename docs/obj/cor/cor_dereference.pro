;=============================================================================
;+
; NAME:
;	cor_dereference
;
;
; PURPOSE:
;	Turns an array of pointers to descriptors into an array of descriptors.
;
;
; CATEGORY:
;	NV/SYS/COR
;
;
; CALLING SEQUENCE:
;	result = cor_dereference(xd)
;
;
; ARGUMENTS:
;  INPUT:
;	xd:	Array of pointers to an arbitrary type of descriptor.
;
;  OUTPUT:
;	NONE
;
;
; KEYWORDS: NONE
;
;
; RETURN:
;	Array of descriptors (structures).
;
;
; STATUS:
;	Complete
;
;
; SEE ALSO:
;	cor_rereference
;
;
; MODIFICATION HISTORY:
; 	Written by:	Spitale, 6/2002
; 	Adapted by:	Spitale, 5/2016
;	
;-
;=============================================================================
function cor_dereference, xd
@core.include

 if(size(xd, /type) NE 11) then return, xd

 s = size(xd)
 n1 = (n2 = 1)
 if(s[0] GT 0) then n1 = s[1]
 if(s[0] GT 1) then n2 = s[2]

 _xd0 = create_struct(name=obj_class(xd[0]))

 _xd = replicate(_xd0, n1, n2)
 for j=0, n2-1 do $
  for i=0, n1-1 do $
   begin
    ii = j*n1 + i
    _xd[ii] = xd[ii].dereference(_xd0)
   end

 return, _xd
end
;=============================================================================
