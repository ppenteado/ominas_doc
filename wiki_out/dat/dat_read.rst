dat\_read.pro
===================================================================================================

`source <./`dat_read.pro>`_

























dat\_read
________________________________________________________________________________________________________________________



`source <./`dat_read.pro>`_

.. code:: IDL

 result = dat_read(filespec, data, header, filetype=filetype, input_fn=input_fn, output_fn=output_fn, keyword_fn=keyword_fn, instrument=instrument, input_translators=input_translators, output_translators=output_translators, input_transforms=input_transforms, output_transforms=output_transforms, tab_translators=tab_translators, maintain=maintain, compress=compress, silent=silent, sample=sample, nodata=nodata, name=name, nhist=nhist, extensions=extensions)



Description
-----------
	Reads a data file of arbitrary format and produces a data descriptor.



Environment variables: 

	NV_TRANSLATORS:		Name(s) of the translators table(s) to use unless
				overridden by the tab_translators keyword.
				Multiple table names are delimited with ':'.

	NV_FTP_DETECT:		Name(s) of the filetype detectors table(s).
				Multiple table names are delimited with ':'.

	NV_IO:			Name(s) of the I/O table(s).
				Multiple table names are delimited with ':'.

	NV_INS_DETECT:		Name(s) of the instrument detectors table(s).
				Multiple table names are delimited with ':'.



	dat_read expands all file specifications and then attempts to detect
	the filetype for each resulting filename using the filetype detectors
	table.  If a filetype is detected, dat_read looks up the I/O functions
	and calls the input function to read the file.  Finally, it calls
	nv_init_descriptor to obtain a data descriptor.


 STATUS:
	Complete


 SEE ALSO:
	dat_write










Returns
-------

	Array of data descriptors - one for each file resulting from the
	expansion of the given file specifications.










+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


Parameters
----------




filespec
-----------------------------------------------------------------------------

*in* 

Array of strings giving file specifications for
			file to read.





data
-----------------------------------------------------------------------------






header
-----------------------------------------------------------------------------






+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




Keywords
--------


.. _filetype
- filetype *in* 

Overrides automatic filetype detection.




.. _input\_fn
- input\_fn *in* 

Overrides input function lookup.




.. _output\_fn
- output\_fn *in* 

Overrides output function lookup.




.. _keyword\_fn
- keyword\_fn 



.. _instrument
- instrument *in* 

Use this instrument name instead of attempting to
			detect it.




.. _input\_translators
- input\_translators 



.. _output\_translators
- output\_translators 



.. _input\_transforms
- input\_transforms 



.. _output\_transforms
- output\_transforms 



.. _tab\_translators
- tab\_translators *in* 

Name of translators table to use instead of
				that given by the environment variable
				NV_TRANSLATORS.  If no path is given, then the
				file is assumed to reside in the same directory
				as the translator named by the NV_TRANSLATORS
				environment variable.




.. _maintain
- maintain 



.. _compress
- compress 



.. _silent
- silent *in* 

	If set, dat_read suppresses superfluous printed output
			and passes the flag to the input function.




.. _sample
- sample *in* 

	Vector giving the sampling indices in the input data
			file.  This parameter is passed through to the input
			function, which may choose to ignore it.




.. _nodata
- nodata 



.. _name
- name 



.. _nhist
- nhist 



.. _extensions
- extensions *in* 

If given, these extensions are attempted for each file.
			If a file with the extension is not found, then the next
			extension is tried until no extensions are left to try.
			If no extensions work, then the raw filename is attemtped.















History
-------

 	Written by:	Spitale, 2/1998











- Lines 165
- McCabe complexity







- File attributes


- Modification date

Tue Oct 11 10:15:05 2016

-Lines


152








