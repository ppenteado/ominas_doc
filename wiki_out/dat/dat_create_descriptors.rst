dat\_create\_descriptors.pro
===================================================================================================

`source <./`dat_create_descriptors.pro>`_

























dat\_create\_descriptors
________________________________________________________________________________________________________________________



`source <./`dat_create_descriptors.pro>`_

.. code:: IDL

 result = dat_create_descriptors(n, end_keywords, crd=crd, dd=dd, silent=silent, abbrev=abbrev, user=user, name=name, tasks=tasks, udata=udata, uname=uname, assoc_xd=assoc_xd, filename=filename, min=min, max=max, dim=dim, cache=cache, type=type, gff=gff, data=data, abscissa=abscissa, nhist=nhist, header=header, filetype=filetype, input_fn=input_fn, output_fn=output_fn, keyword_fn=keyword_fn, instrument=instrument, input_translators=input_translators, output_translators=output_translators, input_transforms=input_transforms, output_transforms=output_transforms, maintain=maintain, compress=compress, tab_translators=tab_translators)



Description
-----------
	Creates and initializes a data descriptor.










Returns
-------

	Newly created and initialized data descriptor.


 STATUS:
	Complete










+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


Parameters
----------




n
-----------------------------------------------------------------------------

*in* 

 Number of descriptors to create.





end\_keywords
-----------------------------------------------------------------------------






+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




Keywords
--------


.. _crd
- crd 



.. _dd
- dd 



.. _silent
- silent *in* 

	If set, messages are suppressed.





.. _abbrev
- abbrev 



.. _user
- user 



.. _name
- name 



.. _tasks
- tasks 



.. _udata
- udata 



.. _uname
- uname 



.. _assoc\_xd
- assoc\_xd 



.. _filename
- filename *in* 

Name of data file.




.. _min
- min 



.. _max
- max 



.. _dim
- dim *in* 

Array giving the dimensions of the data array.




.. _cache
- cache 



.. _type
- type *in* 

Integer giving the type code of the data array.




.. _gff
- gff 



.. _data
- data *in* 

Data array.




.. _abscissa
- abscissa 



.. _nhist
- nhist *in* 

Number of past version of the data array to archive.
		If not given, the environment variable NV_NHIST is
		used.  If that is not set, then nhist defaults to 1.




.. _header
- header *in* 

Header array.




.. _filetype
- filetype *in* 

Filetype identifier string.  If not given
			an attempt is made to detect it.




.. _input\_fn
- input\_fn *in* 

Name of function to read data file.




.. _output\_fn
- output\_fn *in* 

Name of function to write data file.




.. _keyword\_fn
- keyword\_fn *in* 

Name of function to read/write header keywords.




.. _instrument
- instrument *in* 

Instrument string.  If not given an
			attempt is made to detect it.




.. _input\_translators
- input\_translators 

String array giving the names of the
				input translators.




.. _output\_translators
- output\_translators 

String array giving the names of the
				output translators.






.. _input\_transforms
- input\_transforms *in* 

String array giving the names of the
				input transforms.




.. _output\_transforms
- output\_transforms *in* 

String array giving the names of the
				output transforms.




.. _maintain
- maintain *in* 

Data maintenance mode.




.. _compress
- compress *in* 

Compression suffix.




.. _tab\_translators
- tab\_translators 













History
-------

 	Written by:	Spitale, 1/1998
 	Adapted by:	Spitale, 5/2016











- Lines 73
- McCabe complexity







- File attributes


- Modification date

Tue Oct 11 10:03:12 2016

-Lines


14








