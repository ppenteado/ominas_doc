saturn\_example.pro
===================================================================================================

`source <./`saturn_example.pro>`_

*batch file*





 Saturn Example

  	 This example file uses Saturn and its rings to show various
  	 capabilities of the software.  This includes fitting the
  	 limb and rings simultaneously, hiding the limb and/or rings wrt
  	 other objects in the field of view, plotting radial and longitudinal
  	 sectors on the ring and mapping the saturn cloud tops.

  	 This example file can be executed from the UNIX command line using:

    .. code:: IDL

    	  idl ominas saturn.example
    
  	 or from within IDL using:

    .. code:: IDL

    	  @saturn.example
    
  	 After the example stops, later code samples in this file may be executed by
  	 pasting them onto the IDL command line.

 Image read and display

	

 .. image:: ./saturn_load.jpeg

	This first section uses dat_read to read in the image.  The image file
   c3440346.gem is a Voyager VICAR format file where the image has had
   the camera distortions removed with the VICAR program GEOMA.  dat_read
   reads the image portion (im) and the image label (label) and its output
   is a data descriptor (dd).  ctmod is called to reserve several colors
   in the case of an 8-bit display.  tvim is called to display the image
   (im) at 1/2 size in a new window with the y coordinate as top-down.

	For Example:

 .. code:: IDL

     dd = dat_read('data/c3440346.gem', im, label)
   ctmod, top=top
   tvim, im, zoom=0.5, /order, /new, top=top
 
	Blah blah


 Obtaining the descriptors

  	This section obtains the camera descriptor (cd), the planet descriptor
  	(pd) and the ring descriptor (rd) for use by the software.  In this
  	example, the various elements of these descriptors are overridden with
  	values that causes the software not to try to read these values from
  	a detached header or through a translator that would access the data
  	from the default source.

  	Change override to zero to read the data through the translators using
  	the Voyager SEDR instead (assuming you have installed the SEDR data
  	files, which are not provided in the default installation).


  This example, commented out, shows how two objects can be included in
  one planet descriptor.

 Filling the generic descriptor

  	This line fills a "generic" descriptor.  This is a convenience
  	feature where in several descriptors are grouped into a structure that
  	can be passed to functions in one piece.

  	cd - camera descriptor part
  	gbx - globe descriptor part
  	dkx - disk descriptor part

 Calculating the limb, ring and planet center

 Determining the plot characteristics

  This section uses pg_limb to calculate the limb point structure (limb_ptd)
  containing the limb points, the ring point structure (ring_ptd) and also
  the planet center (center_ptd) using the routine pg_center.  It uses the
  generic descriptor (gd) to pass the camera, planet and ring descriptors
  to these routines.  It also uses pg_hide to remove (/rm) points from the
  ring (/disk) from the limb points and then again to remove the ring points
  covered by the planet (/globe).  It then groups each of these into
  object_ptd for plotting.  The colors, psyms, psizes and plables variables
  are defined for the plot.  The center is drawn in the default color
  (!p.color), the limb is in yellow (ctyellow) and the inner and outer ring
  are in red (ctred).  Here you can see that each ring is treated as two
  objects (inner and outer) when defining plot characteristics.  With an
  8-bit display, these color routines return the values that were previously
  reserved in the color table with ctmod; with a 24-bit display, these
  routines return the true color values for these colors.  nlimb stores the
  number of points in the limb_ptd structure, nring, the number of points in
  the ring point structure.  In plabels, the limb and ring's name is not
  plotted since it would be plotted at the center of the object.

 Drawing the limb, ring and planet center

	

 .. image:: ./saturn_limb.jpeg

 This section draws the objects in the object structure (center, limb
 and ring) with the colors and plot symbols and labels defined earlier.
 Notice how the limb and ring curves cut off at the points of intersection
 between the objects.

 Draw planet and ring latitude/longitude grid

	

 .. image:: ./saturn_grid.jpeg

   This sections calculates a latitude/longitude grid for the planet and a
  	radius/longitude grid for the rings.  By default it draws 12 latitude
  	and 12 longitude grid lines.  The longitude grid lines circle the body
  	and so on a map they will appear as 24 grid lines.  The ring radius grid
  	uses four grid lines by default between the inner and outer ring radius.
  	It uses pg_hide to set as not visible the points on the grid behind the
  	planet and ring for both objects.  It then uses pg_draw to draw the
  	planet grid points in blue (ctblue) and the ring grid points in purple
  	(ctpurple).  Here is where the example then stops.

 Manually repointing the geometry

  This pasteable section first clears the screen of the plotted points
  by redisplaying the image with tvim.  It then calls pg_drag to allow
  the user to use the cursor to drag the pointing, and with it the limb,
  ring and planet center.  To move the pointing with pg_drag, use the left
  mouse button and translate the pointing in x,y.  Use the middle mouse
  button to rotate the pointing about an axis (in this case, the axis of
  rotation is set as the planet center (center_ptd[0]).  When the
  desired pointing is set, the right mouse button accepts it.  pg_drag
  returns the delta x,y amount dragged (dxy) as well as the rotation
  angle (dtheta).  pg_repoint uses the dxy and dtheta to update the
  camera descriptor (cd, passed by gd).  The limb and center is then
  recalculated, the image redisplayed to clear the objects drawn, and
  then pg_draw is called to replot.

 Scanning the edge to find the limb and using it to calculate the pointing

  This section calls pg_cvscan to scan the image around the predicted
  limb position and the ring edge position (within width of 80 pixels) and
  find the points of highest correlation with a given edge model for each
  object (edge_model_nav_limb = limb model used in the VICAR program NAV
  and edge_model_nav_ring = ring model from NAV) and zeropoint offset in
  the given model (lzero).  These points are then plotted.

 Thresholding using correlation coefficient

  This section (optional) calls pg_threshold to remove points with lower
  correlation coefficients.  The /relative flag means that the minimum
  and maximum thresholds are taken as a fraction to the maximum value
  in the array.  Notice here again that the ring is treated as two
  objects.

 Removing regions of bad points

  This section (optional) calls pg_select to remove points within a
  polygonal region as defined by the cursor.  Click the left mouse
  button to mark a point and move the mouse to the next point and
  click.  Use the middle mouse button to erase a point and the right
  mouse button to end the region.  pg_trim removes the points in the
  just defined region.  The scan points are then replotted.
  Repeat these statements for each region a user wants to remove.

 Fitting the pointing to the scanned points

  This section calls pg_cvscan_coeff to determine the linear least-squares
  coefficients for a fit to the image coordinate translation and rotation
  which matches the computed curve to the scanned curve. It then calls
  pg_fit to do the fit with the calculated coefficients to calculate the
  correction in translation (dxy) and rotation (dtheta).  It calls
  pg_cvchisq to get the chi square of the fit.  Then calls pg_repoint to
  update the pointing. Recalculates the limb and center and replots.
  The determination of the curves and their subsequent fit can be
  iterated on.

 Defining a ring sector for a plot

  To plot a ring radius vs. intensity or longitude vs. intensity, the
  user must first define the limits of the ring sector.  Here it is
  done in one of two ways, the first is to define the longitude (lon)
  and radius (rad) limits in an array.  The second method is to use
  the cursor to sweep out a ring sector, pg_ring_sector is called to
  do this.  To use the mouse, click in one corner of your desired sector
  and move the cursor to the opposite corner.  In this example,
  counterclockwise is the direction of increasing longitude.  The chosen
  sector is then calculated using pg_profile_ring with the /outline
  keyword.  This outline is then drawn with pg_draw.

 Plotting ring sector plots

  		Below is the code for four different types of plots using pg_profile_ring.
  		Radial (default) and longitudinal (/azimuthal), interpolated (default)
  		and binned (/bin).  There is an oversamp keyword which defines the amount
  		to oversample (vs. 1 pixel).  In the case of a longitudinal bin scan,
  		pixelization can cause some bins to contain very low numbers or none at
  		all.  In this example oversamp=0.3 to cause the plot to have larger bins
  		to help alleviate this problem.  The calculated profile is then plotted
  		in a new window.

 Draw planet and ring latitude/longitude grid

  This sections calculates a latitude/longitude grid for each planet and a
  radius/longitude grid for the rings.  By default it draws 12 latitude
  and 12 longitude grid lines.  The longitude grid lines circle the body
  and so on a map they will appear as 24 grid lines.  The ring radius grid
  uses four grid lines by default between the inner and outer ring radius.
  It uses pg_hide to set as not visible the points on the grid behind the
  planet and ring for both objects.  It then uses pg_draw to draw the
  grid points in blue (ctblue).




















