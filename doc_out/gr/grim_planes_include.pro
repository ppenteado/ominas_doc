;=============================================================================
; grim_next_plane
;
;=============================================================================
pro grim_next_plane, grim_data, norefresh=norefresh

 if(grim_data.n_planes EQ 1) then return

 ;-----------------------------------
 ; change to next valid plane
 ;-----------------------------------
 flags = *grim_data.pl_flags_p

 repeat $
  begin
   grim_data.pn = grim_data.pn + 1
   if(grim_data.pn EQ grim_data.n_planes) then grim_data.pn = 0
  endrep until(flags[grim_data.pn] NE 0)

 grim_set_data, grim_data

 no_erase = 1 
 if(grim_data.type EQ 'plot') then no_erase = 0
 
 if(NOT keyword_set(norefresh)) then grim_refresh, grim_data, no_erase=no_erase, /noglass

 grim_call_plane_callbacks, grim_data
 grim_sync_planes, grim_data
end
;=============================================================================



;=============================================================================
; grim_previous_plane
;
;=============================================================================
pro grim_previous_plane, grim_data

 if(grim_data.n_planes EQ 1) then return

 ;-----------------------------------
 ; change to next valid plane
 ;-----------------------------------
 flags = *grim_data.pl_flags_p

 repeat $
  begin
   grim_data.pn = grim_data.pn - 1
   if(grim_data.pn EQ -1) then grim_data.pn = grim_data.n_planes-1
  endrep until(flags[grim_data.pn] NE 0)

 grim_set_data, grim_data

 no_erase = 1 
 if(grim_data.type EQ 'plot') then no_erase = 0
 
 grim_refresh, grim_data, no_erase=no_erase, /noglass
 grim_call_plane_callbacks, grim_data
 grim_sync_planes, grim_data
end
;=============================================================================



;=============================================================================
; grim_get_plane
;
;=============================================================================
function grim_get_plane, grim_data, all=all, pn=pn, visible=visible

 if(keyword_set(all)) then $
  begin
   flags = *grim_data.pl_flags_p
   pn = where(flags NE 0)
   if(pn[0] EQ -1) then return, 0
  end 

 if(n_elements(pn) NE 0) then pns = pn $
 else pns = grim_data.pn

 planes = (*grim_data.planes_p)[pns]
 return, planes
end
;=============================================================================



;=============================================================================
; grim_test_map
;
;=============================================================================
function grim_test_map, grim_data, plane=plane

 if(NOT keyword_set(plane)) then plane = grim_get_plane(grim_data)

 if(dat_instrument(plane.dd) EQ 'MAP') then return, 1

 if(NOT keyword_set(*plane.cd_p)) then return, 0

 if(cor_class(*plane.cd_p) EQ 'MAP') then return, 1

 return, 0
end
;=============================================================================



;=============================================================================
; grim_test_rgb
;
;=============================================================================
function grim_test_rgb, grim_data, plane
 planes = grim_get_plane(grim_data, /all)
 w = where(planes.dd EQ plane.dd)
 if(n_elements(w) GT 1) then return, 0
 return, n_elements(dat_dim(plane.dd, /true) EQ 3)
end
;=============================================================================



;=============================================================================
; grim_get_image
;
;=============================================================================
function grim_get_image, grim_data, plane=plane, abscissa=abscissa, $
   current=current, sample=sample, channel=channel, nd=nd

 if(NOT keyword_set(plane)) then plane = grim_get_plane(grim_data)

 dim = (dat_dim(plane.dd))[0:1]

 ;--------------------------------------------------------------------
 ; if rgb plane, then override offset to yield image corresponding
 ; to specified channel
 ;--------------------------------------------------------------------
 if(grim_test_rgb(grim_data, plane)) then $
  begin
   true = 0
   if(NOT keyword_set(channel)) then true = 1 $
   else slice = channel
  end

 ;--------------------------------------------------------------------
 ; return image
 ;--------------------------------------------------------------------
 return, dat_data(plane.dd, true=true, $
          sample=sample, current=current, nd=nd, slice=slice, abscissa=abscissa)
end
;=============================================================================



;=============================================================================
; grim_stretch_plane
;
;=============================================================================
pro grim_stretch_plane, grim_data, planes

 n = n_elements(planes)

 if(n GT 1) then grim_print, 'Auto stretching all planes...'

 for i=0, n-1 do $
  begin
   image = grim_get_image(grim_data, plane=planes[i], /current)

   test = image_auto_stretch(bytscl(image), min=min, max=max)
   planes[i].cmd.bottom = min
   planes[i].cmd.top = max
   grim_set_plane, grim_data, planes[i], pn=planes[i].pn
  end

 if(n GT 1) then  grim_print, 'Done', /append
end
;=============================================================================



;=============================================================================
; grim_plane_set_visible
;
;=============================================================================
pro grim_plane_set_visible, grim_data, planes, val, toggle=toggle

 if(keyword_set(toggle)) then $
  begin
   w = where(planes.visible EQ 1)
   ww = where(planes.visible EQ 0)
   if(w[0] NE -1) then planes[w].visible = 0
   if(ww[0] NE -1) then planes[ww].visible = 1
  end $
 else planes.visible = val

 grim_set_plane, grim_data, planes, pn=planes.pn
end
;=============================================================================



;=============================================================================
; grim_get_visible_planes
;
;=============================================================================
function grim_get_visible_planes, grim_data

 plane = grim_get_plane(grim_data)
 all_planes = grim_get_plane(grim_data, /all)
 w = where(all_planes.visible)

 if(NOT plane.visible) then planes = plane
 if(w[0] NE -1) then planes = append_array(planes, all_planes[w])

 return, planes
end
;=============================================================================



;=============================================================================
; grim_set_plane
;
;=============================================================================
pro grim_set_plane, grim_data, plane, pn=pn

 if(NOT ptr_valid(grim_data.planes_p)) then return

 if(n_elements(pn) NE 0) then (*grim_data.planes_p)[pn] = plane $
; else (*grim_data.planes_p)[grim_data.pn] = plane
 else (*grim_data.planes_p)[plane.pn] = plane

end
;=============================================================================



;=============================================================================
; grim_rm_plane
;
;=============================================================================
pro grim_rm_plane, grim_data, pn

 ;---------------------------------------------------------------
 ; if this is the only plane, then exit
 ;---------------------------------------------------------------
 w = where(*grim_data.pl_flags_p EQ 1)
 if(n_elements(w) EQ 1) then $
  begin
   grim_exit, grim_data
   return
  end

 ;---------------------------------------------------------------
 ; mark the specified plane as inactive
 ;  NOTE:  The data for the plane still exists and may continue
 ;         to be used from the command line.
 ;---------------------------------------------------------------
 plane = grim_get_plane(grim_data, pn=pn)
 plane.pn = -1
 grim_set_plane, grim_data, plane, pn=pn

 (*grim_data.pl_flags_p)[pn] = 0

 ;---------------------------------------------------------------
 ; change to a valid plane
 ;---------------------------------------------------------------
 grim_previous_plane, grim_data
 grim_refresh, grim_data


end
;=============================================================================



;=============================================================================
; grim_crop_plane
;
;=============================================================================
pro grim_crop_plane, grim_data, plane

 
 ;----------------------------------------------
 ; plot: crop to visible xrange
 ;----------------------------------------------
 if(grim_data.type EQ 'plot') then $
  begin
   tvgr, grim_data.wnum, get=tvd
   xrange = tvd.xrange

   dat = dat_data(plane.dd, abscissa=x)
   w = where((x GE xrange[0]) AND (x LE xrange[1]))

   dat = dat[w]
   dat_set_data, plane.dd, dat, abscissa=x[w]
  end $
 ;----------------------------------------------
 ; image: crop to visible size
 ;----------------------------------------------
 else $
  begin
   ;- - - - - - - - - - - - - - - - - - - - - - 
   ; sample cropped image
   ;- - - - - - - - - - - - - - - - - - - - - - 
   p0 = [0,0] & p1 = [!d.x_size, !d.y_size]-1
   pp0 = round((convert_coord(/device, /to_data, p0))[0:1])
   pp1 = round((convert_coord(/device, /to_data, p1))[0:1])

   dim = dat_dim(plane.dd)
   xmin = min([pp0[0],pp1[0]])
   xmax = max([pp0[0],pp1[0]])
   ymin = min([pp0[1],pp1[1]])
   ymax = max([pp0[1],pp1[1]])

   xxmin = xmin>0
   xxmax = xmax<dim[0]-1
   yymin = ymin>0
   yymax = ymax<dim[1]-1

   size = [xxmax-xxmin+1, yymax-yymin+1]
   data_xy = gridgen(size, p0=[xxmin,yymin])

   im = grim_get_image(grim_data, plane=plane, sample=data_xy, /nd)
   im = reform(im, size[0], size[1], /over)

   ;- - - - - - - - - - - - - - - - - - - - - - 
   ; update display parameters
   ;- - - - - - - - - - - - - - - - - - - - - - 
   tvim, grim_data.wnum, offset=[0,0], zoom=!d.x_size/float(xmax-xmin)

   ;- - - - - - - - - - - - - - - - - - - - - - 
   ; update data array
   ;- - - - - - - - - - - - - - - - - - - - - - 
   dat_set_data, plane.dd, im, /noevent

   ;- - - - - - - - - - - - - - - - - - - - - - 
   ; modify camera pointing
   ; need to deal with maps as well
   ;- - - - - - - - - - - - - - - - - - - - - - 
   if(NOT grim_test_map(grim_data)) then $
    begin
     cd = *plane.cd_p
     if(keyword_set(cd)) then cam_set_oaxis, cd, cam_oaxis(cd) - [xxmin,yymin]
    end

   nv_flush
  end


end
;=============================================================================



;=============================================================================
; grim_init_parms
;
;=============================================================================
function grim_init_parms, n, color=color, thick=thick, nsum=nsum, psym=psym, $
                          symsize=symsize


 _parm = {grim_parm_data_struct, $
		color:		ctwhite(), $
		thick:		1l, $
		nsum:		0, $
		symsize:	1., $
		psym:		-3l $
              }

 parm = replicate(_parm, n)

 if(keyword__set(color)) then parm.color = color
 if(keyword__set(thick)) then parm.thick = thick
 if(keyword__set(nsum)) then parm.nsum = nsum
 if(keyword__set(psym)) then parm.psym = psym
 if(keyword__set(symsize)) then parm.symsize = symsize

 return, parm
end
;=============================================================================



;=============================================================================
; grim_clone_plane
;
; This is a crappy implementation
;
;=============================================================================
function grim_clone_plane, grim_data, plane=plane, spawn=spawn

; if(keyword_set(spawn)) then 
 grim_add_planes, grim_data, plane.dd, pn=pn

 new_plane = nv_clone(plane)

 new_plane.pn = pn
 (*grim_data.planes_p)[pn] = new_plane

 new_plane.cmd = colormap_descriptor(data=new_plane.pn, $
                                n_colors=grim_n_colors(dat_typecode(new_plane.dd)))

 grim_set_plane, grim_data, new_plane
 grim_set_data, grim_data

 return, new_plane
end
;=============================================================================



;=============================================================================
; grim_channel_to_rgb
;
;=============================================================================
function grim_channel_to_rgb, channel

 rgb = [0b,0b,0b]
 
 ;----------------------------------
 ; string: channel may be r, g, b
 ;----------------------------------
 if(size(channel, /type) EQ 7) then $
  begin
   rgb[0] = channel[i] EQ 'r' ? 1:0
   rgb[1] = channel[i] EQ 'g' ? 1:0
   rgb[2] = channel[i] EQ 'b' ? 1:0
   return, rgb
  end

 ;----------------------------------
 ; byte -- channel is bit mask
 ;----------------------------------
 rgb[0] = (channel AND 1b) NE 0
 rgb[1] = (channel AND 2b) NE 0
 rgb[2] = (channel AND 4b) NE 0

 return, rgb
end
;=============================================================================



;=============================================================================
; grim_add_planes
;
;=============================================================================
pro grim_add_planes, grim_data, dd, pns=pns, filter=filter, fov=fov, clip=clip, hide=hide, $
                      path=path, save_path=save_path, load_path=load_path, $
                      cam_trs=cam_trs, plt_trs=plt_trs, rng_trs=rng_trs, str_trs=str_trs, stn_trs=stn_trs, arr_trs=arr_trs, $
                      sun_trs=sun_trs, color=color, position=_position, $
                      xrange=_xrange, yrange=_yrange, $
                      thick=thick, nsum=nsum, xtitle=xtitle, ytitle=ytitle, $
                      psym=psym, symsize=symsize, max=max, visibility=visibility, channel=channel, $
                      render_sample=render_sample, render_pht_min=render_pht_min, $
                      overlays=overlays, cmd=cmd0

  pns = 0
  MAX_OVERLAYS = 128

  n_planes = n_elements(dd) 

  if(NOT keyword_set(max)) then max = 0

  if(NOT keyword_set(fov)) then fov = grim_data.def_fov
  if(NOT keyword_set(clip)) then clip = grim_data.def_clip
  if(NOT keyword_set(hide)) then hide = grim_data.def_hide
  if(NOT keyword_set(filter)) then filter = grim_data.def_filter
  if(NOT keyword_set(visibility)) then visibility = 0
  if(NOT defined(render_pht_min)) then render_pht_min = 0.02
  if(NOT keyword_set(render_sample)) then render_sample = 1

  if(NOT keyword_set(load_path)) then load_path = grim_data.def_load_path
  if(NOT keyword_set(save_path)) then save_path = grim_data.def_save_path

  if(NOT keyword_set(cam_trs)) then cam_trs = grim_data.def_cam_trs
  if(NOT keyword_set(plt_trs)) then plt_trs = grim_data.def_plt_trs
  if(NOT keyword_set(rng_trs)) then rng_trs = grim_data.def_rng_trs
  if(NOT keyword_set(str_trs)) then str_trs = grim_data.def_str_trs
  if(NOT keyword_set(stn_trs)) then stn_trs = grim_data.def_stn_trs
  if(NOT keyword_set(arr_trs)) then arr_trs = grim_data.def_arr_trs
  if(NOT keyword_set(sun_trs)) then sun_trs = grim_data.def_sun_trs

  if(NOT keyword_set(color)) then color = grim_data.def_color
  if(NOT keyword_set(thick)) then thick = grim_data.def_thick
  if(NOT keyword_set(nsum)) then nsum = grim_data.def_nsum
  if(NOT keyword_set(psym)) then psym = grim_data.def_psym
  if(NOT keyword_set(symsize)) then symsize = grim_data.def_symsize

  if(NOT keyword_set(title)) then title = grim_data.def_title
  if(NOT keyword_set(xtitle)) then xtitle = grim_data.def_xtitle
  if(NOT keyword_set(ytitle)) then ytitle = grim_data.def_ytitle

  xrange = [0.,0.]
  yrange = [0.,0.]
  if(keyword_set(_xrange)) then xrange = _xrange
  if(keyword_set(_yrange)) then yrange = _yrange
  if(n_elements(xrange)/2 NE n_planes) then $
                                    xrange = xrange#make_array(n_planes,val=1d)
  if(n_elements(yrange)/2 NE n_planes) then $
                                    yrange = yrange#make_array(n_planes,val=1d)

  position = [0.,0.,0.,0.]
  if(keyword_set(_position)) then position = _position
  dim = size(position, /dim)
  if(n_elements(dim) EQ 1) then dim = [dim,1]
  if(dim[1] NE n_planes) then position = position#make_array(n_planes,val=1d)
  if(dim[0] EQ 2) then position = [position, dblarr(2,n_planes)]


  ;--------------------------
  ; plot parms data structure
  ;--------------------------
  n = n_elements(dd)
  parm = grim_init_parms(n, color=color, thick=thick, nsum=nsum, psym=psym, symsize=symsize)


  ;--------------------------------
  ; 8 or 24-bit display?
  ;--------------------------------
;n_colors = 256
;  ctmod, visual=visual
;  if(visual EQ 8) then n_colors = !d.n_colors $
;  else if(visual EQ 24) then n_colors = 256 $
;  else message, 'Only 8 and 24-bit displays supported.'


  window, /free, /pix, xs=1, ys=1	; necessary to allocate color table
  ctmod

  ;---------------------
  ; planes
  ;---------------------
  planes = *grim_data.planes_p
  flags = *grim_data.pl_flags_p

  if(n_elements(xtitle) EQ 1) then xtitle = make_array(n_planes, val=xtitle)
  if(n_elements(ytitle) EQ 1) then ytitle = make_array(n_planes, val=ytitle)
  if(n_elements(title) EQ 1) then title = make_array(n_planes, val=title)

  for i=0, n_planes-1 do $
   begin
    flag = 1
    if(cor_name(dd[i]) EQ 'BLANK') then flag = 2

    vis = 0b
    if(keyword_set(visibility)) then vis = visibility
    if(n_elements(vis) GT 1) then vis = vis[i]

    rgb = [1,1,1]
    if(keyword_set(channel)) then rgb = grim_channel_to_rgb(channel[i])

    plane = {grim_planes_struct, $
	;---------------
	; bookkeeping
	;---------------
		pn		:	-1, $
		grnum		:	grim_data.grnum, $
		filter		:	filter, $
		load_path	:	load_path, $
		save_path	:	save_path, $
		rendering	:	0, $
		render_sample	:	render_sample, $
		render_pht_min	:	render_pht_min, $
		render_show	:	1b, $
		prescaled	:	0, $			; overlays always visible?
		visible		:	0, $			; overlays always visible?
		image_visible	:	0, $
		tvd_save_p	:	ptr_new(0), $
		cradec		:	dblarr(1,3), $
		dradec		:	dblarr(1,3), $
		max		:	double(max), $
		t0		:	0d, $			; last cd time, $
		initial_overlays_p :	ptr_new(overlays), $

	;---------------
	; plot viewing
	;---------------
		xrange		:	xrange[*,i], $
		yrange		:	yrange[*,i], $
		position	:	position[*,i], $
		title		:	title[i], $
		xtitle		:	xtitle[i], $
		ytitle		:	ytitle[i], $
		parm		:	parm[i], $

	;---------------
	; descriptors
	;---------------
		dd		:	dd[i], $		; Data descriptor
		sibling_dd	:	obj_new(), $		; Last sibling dd
		cd_p		:	ptr_new(obj_new()), $	; Camera descriptor
		pd_p		:	ptr_new(obj_new()), $	; Planet descriptors
		rd_p		:	ptr_new(obj_new()), $	; Ring descriptors
		sd_p		:	ptr_new(obj_new()), $	; Star descriptors
		sund_p		:	ptr_new(obj_new()), $	; Sun descriptor
		std_p		:	ptr_new(obj_new()), $	; Station descriptors
		ard_p		:	ptr_new(obj_new()), $	; Array descriptors
		od_p		:	ptr_new(obj_new()), $	; Observer descriptor

	;----------------------------
	; active objects
	;----------------------------
; it may be simpler to implement these as udata on each overlay ptd or xd
		active_xd_p	:	ptr_new(obj_new()), $	; Descriptors of
								;  active objects
		active_overlays_ptdp :	ptr_new(obj_new()), $	; Active overlays

		active_user_tags_p	:	ptr_new(''), $	

	;-----------------------------------------------------------
	; overlay points arrays  -- 
	;  Each overlay array, *(*overlay_ptdps)[i], has dimensions
	;  (nptd, nd), where nd is the number of descriptors 
	;  (planets, rings, etc.) and nptd is the number of arrays per
	;  descriptor (e.g., rings have two arrays per descriptor).
	;-----------------------------------------------------------
		overlay_ptdps		:	ptr_new(0), $
; it may be simpler to implement these as udata on each overlay ptd
		overlay_names_p		:	ptr_new(''), $
		overlay_classes_p	:	ptr_new(0), $
		overlay_genres_p	:	ptr_new(0), $
		overlay_dep_p		:	ptr_new(0), $
		overlay_labels_p	:	ptr_new(0), $
		overlay_color_p		:	ptr_new(''), $
		overlay_psym_p		:	ptr_new(0), $
		overlay_symsize_p	:	ptr_new(0.), $ 
		overlay_shade_p		:	ptr_new(0.), $ 
		overlay_tlab_p		:	ptr_new(0b), $
		overlay_tshade_p	:	ptr_new(0b), $
		overlay_tfill_p		:	ptr_new(0b), $
		overlay_data_p		:	ptr_new(0), $
		override_color		:	'', $

;	;-----------------------------------------------------------
;	; fill arrays
;	;-----------------------------------------------------------
;		fill_poly_ptdps		:	ptr_new(0), $
;		fill_color_p		:	ptr_new(0), $
;		fill_names_p		:	ptr_new(''), $

	;-----------------------------------------------------------
	; special arrays
	;-----------------------------------------------------------
		roi_p		:	ptr_new(0), $
		roi_ptd		:	pnt_create_descriptors(), $
		star_labels_p	:	ptr_new(0), $
		mask_p		: 	ptr_new(-1), $
		tiepoint_ptdp	: 	ptr_new(obj_new()), $
		curve_ptdp	: 	ptr_new(obj_new()), $
		user_ptd_tlp	:	ptr_new(), $	
		notes_p		:	ptr_new(''), $

	;-----------------
	; stretch
	;-----------------
		cmd		:	{colormap_descriptor}, $

	;-------------------
	; image visibility
	;-------------------
		rgb		:	byte(rgb), $ 		; 1=selected
		visibility	:	byte(vis), $		; 0=normal, 1=always

	;-----------------
	; points settings
	;-----------------
		hide		:	byte(hide), $
		fov		:	float(fov), $
		clip		:	float(clip), $
		cam_trs		:	cam_trs, $ 
		plt_trs		:	plt_trs, $ 
		rng_trs		:	rng_trs, $ 
		str_trs		:	str_trs, $ 
		stn_trs		:	stn_trs, $ 
		arr_trs		:	arr_trs, $ 
		sun_trs		:	sun_trs $ 
	     }


    new = 0
    if(NOT keyword__set(planes)) then new = 1 $
    else if(cor_name(planes[0].dd) EQ 'BLANK') then new = 1

    ;------------------------------------------------
    ; the first non-blank plane --
    ;------------------------------------------------
    if(new) then $
     begin
      planes = plane
      pn = 0
      pns = [pn]
      flags = flag
     end $
    else $
    ;------------------------------------------------
    ; an additional plane
    ;------------------------------------------------
     begin
      w = where(flags EQ 0)
      ;------------------------------------------------
      ; replace a defunct plane ...
      ;------------------------------------------------
      if(w[0] NE -1) then $
       begin
        pn = w[0]
        planes[pn] = plane
        flags[pn] = flag
       end $
      ;------------------------------------------------
      ; append plane at end of list ...
      ;------------------------------------------------
      else $
       begin
        planes = [planes, plane]
        flags = [flags, flag]
        pn = n_elements(planes) - 1
       end

      if(NOT keyword__set(pns)) then pns = [pn] $
      else pns = [pns, pn]
     end

    planes[pn].pn = pn

    ;--------------------------------------------
    ; create colormap
    ;--------------------------------------------
    planes[pn].cmd = colormap_descriptor(data=planes[pn].pn, cmd0=cmd0, $
                          n_colors=grim_n_colors(dat_typecode(planes[pn].dd)))

    ;--------------------------------------------
    ; create overlay arrays
    ;--------------------------------------------
    grim_create_overlays, grim_data, plane
   end

 planes.image_visible = 1

 grim_data.n_planes = n_elements(planes)
 *grim_data.planes_p = planes
 *grim_data.pl_flags_p = flags

end
;=============================================================================

pro grim_planes_include
a=!null
end

