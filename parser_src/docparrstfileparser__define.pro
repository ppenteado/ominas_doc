; docformat = 'rst'

;+
; Parses .idldoc files.
;-


;+
; Parse the given .idldoc file.
;
; :Returns: file tree object
; :Params:
;    filename : in, required, type=string
;       absolute path to .pro file to be parsed
;
; :Keywords:
;    found : out, optional, type=boolean
;       returns 1 if filename found, 0 otherwise
;    directory : in, required, type=object
;       directory tree object
;-
function docparidldocfileparser::parse, filename, found=found, $
                                        directory=directory
  compile_opt strictarr, hidden

  file = obj_new('DOCtreeIDLdocFile', $
                 basename=file_basename(filename), $
                 directory=directory, $
                 system=self.system)

  self.system->getProperty, format=format, markup=markup
  formatParser = self.system->getParser('rstformat');format + 'format')
  markupParser = self.system->getParser('rstmarkup');markup + 'markup')

  nLines = file_lines(filename)
  if (nLines gt 0) then begin
    comments = strarr(nLines)
    openr, lun, filename, /get_lun
    readf, lun, comments
    free_lun, lun

    ; call format parser's "parse" method
    formatParser->parseIDLdocComments, comments, file=file, $
                                       markup_parser=markupParser
  endif

  return, file
end




;+
; Define instance variables.
;
; :Fields:
;    system
;       system tree object
;-
pro docparrstfileparser__define
  compile_opt strictarr, hidden

	define = { DOCparrstFileParser, $
	           inherits DOCparIDLdocFileParser $
           }
end
