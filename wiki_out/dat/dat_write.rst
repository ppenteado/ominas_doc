dat\_write.pro
===================================================================================================

`source <./`dat_write.pro>`_

























dat\_write
________________________________________________________________________________________________________________________



`source <./`dat_write.pro>`_

.. code:: IDL

 dat_write, filespec, dd, nodata=nodata, filetype=filetype, output_fn=output_fn, verbose=verbose



Description
-----------
	Writes a data file of arbitrary format.



	dat_write expands all file specifications and attempts to write a
	file corresponding to each given data descriptor.  An error results
	if the filespec expands to a different number of files than the number
	of given data descriptors.


 STATUS:
	Complete


 SEE ALSO:
	dat_read













+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


Parameters
----------




filespec
-----------------------------------------------------------------------------

*in* 

Array of strings giving file specifications for
			file to write.





dd
-----------------------------------------------------------------------------

*in* 

	Array of data descriptors.





+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




Keywords
--------


.. _nodata
- nodata 



.. _filetype
- filetype *in* 

Overrides data descriptor filetype (and thus the
			output function).




.. _output\_fn
- output\_fn *in* 

Overrides data descriptor output function.




.. _verbose
- verbose *in* 

If set, message are enabled.















History
-------

 	Written by:	Spitale, 7/1998
 	Adapted by:	Spitale, 5/2016











- Lines 73
- McCabe complexity







- File attributes


- Modification date

Mon Sep 19 07:42:22 2016

-Lines


60








