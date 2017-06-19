mosaic\_example.pro
===================================================================================================

`source <./`mosaic_example.pro>`_


*includes main-level program*




 MOSAIC EXAMPLE

   This example requires the following kernel files, which are
   included in the demo's data directory:

   .. code:: IDL

    $CAS_SPICE_CK/001103_001105ra.bc
    $CAS_SPICE_CK/001105_001108.bc
    $CAS_SPICE_CK/001026_001029ra.bc
    $CAS_SPICE_CK/001029_001031ra.bc
   
   This example file demonstrates how to construct a mosaic using OMINAS.
   This example file can be executed from the UNIX command line using:

   .. code:: IDL


  	  ominas mosaic_example

   or from within an OMINAS IDL session using:

   .. code:: IDL


  	  @mosaic_example

   After the example stops, later code samples in this file may be executed by
   pasting them onto the IDL command line.

 Navigate on limbs automatically

   pg_farfit finds the limb to within a few pixels.  In reality, you would
   want to refine the pointing by scanning for the limb and performing a
   least-squares fit, but for the purposes of clarity in this example, the
   inital fit will do.  See jup_cassini.example and dione.example for examples
   of least-squares fits to image features.

 Correct photometry

   Here, a crude photometric correction is performed for the purposes
   of this example.

   In addition to the corrected images, the output descriptors, dd_pht,
   will contain the photometric angles in their user data arrays with
   the names 'EMM', 'INC' and 'PHASE'.

 Project maps

   Note that all map projections use the same map descriptor.

   Also, aux=['EMM'] is used with pg_map to direct it to reproject
   the emmision angle array that was produced and stored in the data descriptor
   by pg_photom.  That array will be needed by pg_mosaic.

 Introducing wind profiles

 Use the commented commands instead to include a zonal wind profile in
 the projection.

 Construct the mosaic

   The combination function 'emm' combines the maps
   using wighting proprtional to emm^x, where emm is the emmision
   cosine.  It also imposes a minimum emmision cosine, emm0.  Note
   that the emission angles were computed by pg_photom and
   reprojected by pg_map, as directed by the 'aux' keyword.

 Save the mosaic and map info

   To read the mosaic and projection info:

   .. code:: IDL

    dd = dat_read('./data/test.msc', mosaic, label)
    md = pg_get_maps(dd)





















