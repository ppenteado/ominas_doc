; docformat = 'rst'

;+
; Destination class to output reStructuredText.
;-


;+
; Text to include afer a markup node of the given type.
;
; :Private:
;
; :Returns:
;    string
;
; :Params:
;    type : in, required, type=string
;       type of `MGtmNode`
;
; :Keywords:
;    newline : out, optional, type=boolean, default=0
;       set to a named variable to get whether a newline should be added
;       at the given node
;    tag : in, required, type=object
;       tag's object reference
;-
function pptmrst::_preTag, type, newline=newline, tag=tag
  compile_opt strictarr

  case type of
    '': return, self.indent
    'bold': return, '**'
    'code': return, '`'
    'listing': begin
      indent=tag.getattribute('indent',found=found)
      indent=found ? indent : '';0
      ind=indent; ? strjoin(replicate(' ',indent)) : ''
      newline=1
      return,ind+'.. code:: IDL'+string(10B)+string(10B)
    end
    'image': begin
     source=tag.getattribute('source',found=found)
     indent=tag.getattribute('indent',found=found)
     indent=found ? indent : '';0
     ind=indent; ? strjoin(replicate(' ',indent)) : ''
     location=tag.getattribute('location',found=found)
     newline=1
      return,string(10B)+ind+'.. image:: '+(found ? location : '')+source
    end
    'text': begin
      indent=self.indent;tag.getattribute('indent',found=found)
      ;indent=found ? indent : ''
      return,indent
    end
    'link': begin
      reference=tag.getattribute('reference',found=found)
      if strmatch(reference,'*::*') then begin
        tag._print
      endif
      tag.addattribute,'reference',pp_escaperst(reference)
      if found then begin
        ttext=self.findnode(tag,isa='mgtmtext',parent=parent,cindex=cindex)
        if ttext then ttext.getproperty,text=text else return,''
        if stregex(reference,'[^:]+:p:('+text+')',/boolean) then return,'' else begin
          if stregex(reference,'\.rst#'+text+'$',/boolean) then begin
             refs=stregex(reference,'(.*)\.rst#'+text+'$',/subexpr,/extract)
             nt=mgtmtext(text=text+' <'+pp_escaperst(refs[1])+'#'+pp_escaperst(text)+'>')
             parent.removechild,cindex
             parent.addchild,nt,position=cindex
            return,''
          endif else return,reference ? '`' : ''
        endelse
      endif
      return,''
    end
    'emphasis': return, '*'
    'newline': begin
        newline = 1
        return, ''
      end
    'paragraph': return, ''
    'preformatted': return, ''
    else: return, ''
  endcase
end

function pptmrst::findnode,tag,isa=isav,parent=parent,cindex=cindex
compile_opt idl2,logical_predicate
ret=0

tag.getproperty,n_children=nc
parent=tag
for i=0,nc-1 do begin
  c=tag.getchild(i)
  cindex=i
  if isav then begin
    if isa(c,isav) then return,c else begin
      if isa(c,'mgtmtag') then begin
        ret=self.findnode(c,isa=isav,parent=parent,cindex=cindex)
        if ret then return,ret
      endif
    endelse
  endif
endfor

return,ret
end


;+
; Text to include after a markup node of the given type.
;
; :Private:
;
; :Returns:
;    string
;
; :Params:
;    type : in, required, type=string
;       type of `MGtmNode`
;
; :Keywords:
;    newline : out, optional, type=boolean, default=0
;       set to a named variable to get whether a newline should be added
;       at the given node
;    tag : in, required, type=object
;       tag's object reference
;-
function pptmrst::_postTag, type, newline=newline, tag=tag
  compile_opt strictarr

  case type of
    '': return, ''
    'bold': return, '**'
    'code': return, '`'
    'emphasis': return, '*'
    'newline': return, ''
    'paragraph': begin
        newline = 1
        return, ''
      end
     'listing': begin
        newline = 1
        return, ''
      end
      'link': begin
        reference=tag.getattribute('reference',found=found)
        if found then begin
          ;ttext=(tag.getchild(0)).getchild(0)
          ttext=self.findnode(tag,isa='mgtmtext')
          if ttext then ttext.getproperty,text=text else return,''
          texttr=pp_escaperst((strsplit(text,/extract))[0])
          if strmatch(text,'*::*') then begin
            tag._print
          endif
          if stregex(reference,'[^:]+(:p:)?('+texttr+')',/boolean) then return,'_' else begin
            if reference then begin
              if stregex(reference,'\.rst#'+texttr+'$',/boolean) then begin
                return,'_'
              endif else return,' <'+reference+'>`_'
            endif
          endelse
        endif else return,'' 
        return,''
      end
    'preformatted': begin
        newline = 1
        return, ''
      end
    else: return, ''
  endcase
end


pro pptmrst::fixindent,tree
compile_opt idl2,logical_predicate


if isa(tree,'mgtmtag') then begin
  tree.getproperty,n_children=nc
  ;nc=0
endif else return
if ~nc then return
types=strarr(nc)
children=objarr(nc)
names=strarr(nc)
for i=0,nc-1 do begin
  ci=tree.getchild(i)
  ci.getproperty,type=type
  types[i]=type
  children[i]=ci
  names[i]=strlowcase(typename(ci))
;  if (type eq 'image') || (type eq 'listing') then begin
;    found=1
;    break
;  endif
endfor

w=where((types eq 'image') or (types eq 'listing'),count)
pc=0
foreach ww,w,iw do begin
  if (ww lt 1) then continue  
  wt=where(names[pc:ww-1] eq 'mgtmtext',countt)
  indent=0
  if countt then begin
    c=(children[pc:ww-1])[wt[-1]]
    c.getproperty,text=text
    sp=stregex(text,'([[:space:]]*)',/extract,/subexpr)
    indent=strlen(sp[0])
  endif
  indent=indent ? strjoin(replicate(' ',indent)) : ''
  ci=children[ww]
  ci.addattribute,'indent',indent
endforeach

end

pro pptmrst::addindent,tree,ind
compile_opt idl2,logical_predicate
prev=0
if strlen(ind) && isa(tree,'mgtmtag') then begin
  tree.getproperty,n_children=nc
  for i=0,nc-1 do begin
    ci=tree.getchild(i)
    if isa(ci,'mgtmtext') then begin
      if ~isa(prev,'mgtmtext') then begin
        ;ci.addattribute,'indent',ind
        ci.getproperty,text=text
      endif
    endif
    prev=ci
  endfor
endif
end

function pptmrst::process, formatTree, _newline=newline
compile_opt idl2,logical_predicate

;if isa(formattree,'mgtmtext') then begin
;  formattree.getproperty,text=text
;  if strmatch(text,'*updateranges*') then begin
;    formattree._print
;  endif
;endif

self.fixindent,formattree


formattree.getproperty,type=type
changeindent=0
if (type eq 'listing') then begin
  indent=formattree.getattribute('indent',found=found)
  indent=found ? indent : ''
  if indent then begin
    self.indent+=indent
    changeindent=1
  endif
endif
ret=self.mgtmlanguage::process(formatTree, _newline=newline)
if changeindent then begin
  self.indent=strmid(self.indent,0,strlen(self.indent)-strlen(indent))
endif
return,ret
end


;+
; Define `MGtmRST` class for processing restructured text.
;-
pro pptmrst__define
  compile_opt strictarr

  define = { pptmrst, inherits mgtmlanguage,indent:'' }
end
