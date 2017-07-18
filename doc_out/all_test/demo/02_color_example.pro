;---------------------------------------------------
; File names; R,G,B filters
;---------------------------------------------------
files = '~/casIss/1460/' + $
         ['N1460072434_1.IMG', $			; RED
          'N1460072401_1.IMG', $			; GRN
          'N1460072467_1.IMG']				; BL1


;------------------------------------------------------------------
; Display with GRIM; compute overlays
;------------------------------------------------------------------
grim, files, ext='.cal', visibility=1, channel=[1b,2b,4b], /activate, $
  over=['planet_center', $
        'limb:SATURN', $
        'terminator:SATURN', $
        'planet_grid:SATURN', $
        'ring']

stop

; To adjust levels, use Plane->Settings

; To coregister, either:
;  1) Correct the pointing for each plane separately (use farfit, 
;     or rendernav, or the "Navigate" cursor mode), and then use Plane->Coregister
;
;	or
;
;  2) Use Corrections->Shift Image to shift each plane around manually.  I have 
;     left/right/up/down options mapped to arrow kys in my .Xdefaults
;
;	or
;
;  3) Use the "Drag" cursor mode to manually drag each plane around

; To save the product, use File->Open as RGB, and then save that image using
; File->Save As

; To open that file in GRIM (from unix shell):
;  1) grim <file> channel=1,2,4 vis=1	# Opens on separate planes, as in 
;					# original example.
;
;	or
;
;  2) grim <file> -rgb			# opens as one plane; no separate 
;					# adjustment possible.




; open as rgb
; save rgb (rgb.vic)
; open rgb as cube and rgb: grim rgb.vic <-rgb>
