; docformat = 'rst'

;+
; Handles parsing of the OMINAS comment template style comment blocks.
;-

;+
; Handle a section of an IDL format code header.
;
; :Params:
;    lines : in, required, type=strarr
;       lines of a section of an IDL format code header
;
; :Keywords:
;    routine : in, required, type=object
;       routine tree object
;    markup_parser : in, required, type=object
;       markup parser object
;    keyword : in, optional, type=boolean
;       set to indicate keywords are being parsed
;    optional : in, optional, type=boolean
;       set to indicate optional parameters are being parsed
;    input : in, optional, type=boolean
;       set to indicate inputs are being parsed
;    tag : in, required, type=string
;       name of section parsing
;-
pro docparidlformatparser::_handleArguments, lines, routine=routine, $
  markup_parser=markupParser, $
  keyword=keyword, $
  optional=optional, $
  required=required, $
  input=input, $
  tag=tag
  compile_opt strictarr, hidden

  argLines = lines

  ; find lines specifying argument names
  argPos = stregex(argLines, '^[[:space:]]*([[:alnum:]_$]+):', $
    /subexpr, length=argLen)

  ; only interested in subexpression
  argPos = argPos[1, *]
  argLen = argLen[1, *]
  args = where(argPos ne -1L, nArgs)
  if (nArgs lt 1) then return

  argEnds = nArgs eq 1 ? n_elements(argPos) - 1L : [args[1:*] - 1L, n_elements(argPos) - 1L]

  routine->getProperty, file=file

  for a = 0L, nArgs - 1L do begin
    argumentName = strmid(argLines[args[a]], argPos[args[a]], argLen[args[a]])
    arg = keyword_set(keyword) $
      ? routine->getKeyword(argumentName, found=found) $
      : routine->getParameter(argumentName, found=found)

    routine->getProperty, name=routineName
    if (~found) then begin
      arg = keyword_set(keyword) $
        ? routine->getKeyword('_'+argumentName, found=found) $
        : routine->getParameter('_'+argumentName, found=found)
      if (~found) then begin
        self.system->warning, tag + ' ' + argumentName $
          + ' not found in ' + routineName
        continue
      endif
    endif

    ; set attributes of the argument
    arg->setProperty, is_optional=keyword_set(optional), $
      is_required=keyword_set(required)
    if (keyword_set(input)) then arg->setProperty, is_input=1B

    ; set comments for the argument
    comments = lines[args[a]:argEnds[a]]
    comments[0] = strmid(comments[0], argPos[args[a]] + argLen[args[a]] + 2L)
    arg->setProperty, comments=markupParser->parse(comments, file=file)
  endfor
end

;+
; Handles one tag in a file's comments.
;
; :Params:
;    tag : in, required, type=string
;       rst tag, i.e. returns, params, keywords, etc.
;    lines : in, required, type=strarr
;       lines of raw text for that tag
;
; :Keywords:
;    file : in, required, type=object
;       routine file object
;    markup_parser : in, required, type=object
;       markup parser object
;-
pro docparominasformatparser::_handleFileTag, tag, lines, $
  file=file,  $
  markup_parser=markupParser
  compile_opt strictarr, hidden

  case strlowcase(tag) of
    'input':
    'output':
    'return':
    else: self.docparidlformatparser::_handleFileTag, tag, lines, file=file, markup_parser=markupParser
  endcase
end


;+
; Handles one tag in a routine's comments.
;
; :Params:
;    tag : in, required, type=string
;       rst tag, i.e. returns, params, keywords, etc.
;    lines : in, required, type=strarr
;       lines of raw text for that tag
;
; :Keywords:
;    routine : in, required, type=object
;       routine tree object
;    markup_parser : in, required, type=object
;       markup parser object
;-
pro docparominasformatparser::_handleRoutineTag, tag, lines, $
                                              routine=routine,  $
                                              markup_parser=markupParser
  compile_opt strictarr, hidden
  
  if strmatch(tag,'*: NON') then return

  routine->getProperty, file=file

  case strlowcase(tag) of
    'input': begin
        tag='inputs'
        self.docparidlformatparser::_handleRoutineTag, tag, lines,routine=routine,markup_parser=markupParser
     end
    'output': begin
        tag='outputs'
        self.docparidlformatparser::_handleRoutineTag, tag, lines,routine=routine,markup_parser=markupParser
     end
     'return': begin
       tag='outputs'
       self.docparidlformatparser::_handleRoutineTag, tag, lines,routine=routine,markup_parser=markupParser
     end
     'keyword input': self->_handleArguments, lines, routine=routine, markup_parser=markupParser, /input, /keyword, tag='keyword'
     'keyword output': self->_handleArguments, lines, routine=routine, markup_parser=markupParser, input=0, /keyword, tag='keyword'
     'environment variables': begin
        tag='procedure'
        lines=['Environment variables: ','',lines]
        self.docparidlformatparser::_handleRoutineTag, tag, lines,routine=routine,markup_parser=markupParser
      end
      'status': begin
        tag='restrictions'
        lines=['Status: ','',lines]
        self.docparidlformatparser::_handleRoutineTag, tag, lines,routine=routine,markup_parser=markupParser
      end     
    else: begin
        self.docparidlformatparser::_handleRoutineTag, tag, lines,routine=routine,markup_parser=markupParser
      end
  endcase
end


;+
; Handles parsing of a comment block using IDL syntax.
;
; :Params:
;    lines : in, required, type=strarr
;       all lines of the comment block

; :Keywords:
;    routine : in, required, type=object
;       routine tree object
;    markup_parser : in, required, type=object
;       markup parser object
;-
pro docparominasformatparser::parseRoutineComments, lines, routine=routine, $
                                                 markup_parser=markupParser
  compile_opt strictarr, hidden

  if (n_elements(lines) eq 0) then return

  ; look for section names
  sectionNames = ['name', 'purpose', 'category', 'calling sequence', $
                  'inputs', 'optional inputs', 'input', 'keyword parameters', $
                  'outputs', 'optional outputs', 'output', 'return', 'common blocks', $
                  'side effects', 'restrictions', 'procedure', 'example', $
                  'modification history','keywords','environment variables'] + ':'
                  

  tagLocations = bytarr(n_elements(lines))
  for s = 0L, n_elements(sectionNames) - 1L do begin
    ;tagLocations or= strlowcase(strtrim(lines, 2)) eq sectionNames[s]
    tagLocations or= strmatch(strlowcase(strtrim(lines, 2)),sectionNames[s]+'*')
    ;tagLocations or= strmatch(strlowcase(strtrim(lines, 2)),sectionNames[s]+'*NONE')
  endfor

  tagStarts = where(tagLocations, nTags)
  if (nTags eq 0) then return
  tagEnds = nTags eq 1 ? n_elements(lines) - 1L : [tagStarts[1:*] - 1L, n_elements(lines) - 1L]
  previoustag=''
  for t = 0L, nTags - 1L do begin
    tag = strtrim(lines[tagStarts[t]], 2)
    tag = strmid(tag, 0, strlen(tag) - 1L)

    
    if (tagStarts[t] + 1L lt tagEnds[t]) then begin
      if strmatch(tag,'INPUT*') then begin
        if strmatch(previoustag,'KEYWORD*') then tag='KEYWORD INPUT'
      endif
      if strmatch(tag,'OUTPUT*') then begin
        if strmatch(previoustag,'KEYWORD*') && (tagstarts[t]+2L lt tagends[t]) then begin
          tag='KEYWORD OUTPUT'
        endif
      endif
      
      self->_handleRoutineTag, tag, lines[tagStarts[t] + 1L:tagEnds[t]], $
                               routine=routine, markup_parser=markupParser
    endif
    previoustag=tag
  endfor
end


;+
; Handles parsing of a comment block associated with a file.
;
; :Params:
;    lines : in, required, type=strarr
;       all lines of the comment block
;
; :Keywords:
;    file : in, required, type=object
;       file tree object
;    markup_parser : in, required, type=object
;       markup parser object
;-
pro docparominasformatparser::parseFileComments, lines, file=file, $
                                              markup_parser=markupParser
  compile_opt strictarr, hidden

  if (n_elements(lines) eq 0) then return

  ; look for section names
  sectionNames = ['name', 'purpose', 'category', 'calling sequence', $
                  'inputs', 'optional inputs', 'input', 'keyword parameters', $
                  'outputs', 'optional outputs', 'output', 'return', 'common blocks', $
                  'side effects', 'restrictions', 'procedure', 'example', $
                  'modification history'] + ':'

  tagLocations = bytarr(n_elements(lines))
  for s = 0L, n_elements(sectionNames) - 1L do begin
    tagLocations or= strlowcase(strtrim(lines, 2)) eq sectionNames[s]
  endfor

  tagStarts = where(tagLocations, nTags)
  if (nTags eq 0) then return
  tagEnds = nTags eq 1 ? n_elements(lines) - 1L : [tagStarts[1:*] - 1L, n_elements(lines) - 1L]
  for t = 0L, nTags - 1L do begin
    tag = strtrim(lines[tagStarts[t]], 2)
    tag = strmid(tag, 0, strlen(tag) - 1L)

    if (tagStarts[t] + 1L lt tagEnds[t]) then begin
      self->_handleFileTag, tag, lines[tagStarts[t] + 1L:tagEnds[t]], $
                            file=file, markup_parser=markupParser
    endif
  endfor
end








;+
; Define instance variables.
;-
pro docparominasformatparser__define
  compile_opt strictarr, hidden

  define = { DOCparOMINASFormatParser, inherits DOCparIDLFormatParser }
end
