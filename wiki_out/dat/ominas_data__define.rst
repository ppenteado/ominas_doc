ominas\_data\_\_define.pro
===================================================================================================

`source <./`ominas_data__define.pro>`_













Class description for ominas\_data
___________________________________________________________________________________________________________


`source <./`ominas_data__define.pro>`_


Inheritance
-----------


- OMINAS\_CORE





All ancestor classes
--------------------


- OMINAS\_CORE

- IDL\_OBJECT











Properties
----------


- filetype *init* 



- output\_translators *init* 



- user *init* 



- uname *init* 



- max *init* 



- input\_fn *init* 



- header *init* 



- name *init* 



- tab\_translators *init* 



- keyword\_fn *init* 



- gff *init* 



- nhist *init* 



- udata *init* 



- input\_translators *init* 



- filename *init* 



- input\_transforms *init* 



- dd *init* 



- assoc\_xd *init* 



- crd *init* 



- abbrev *init* 



- maintain *init* 



- data *init* 



- tasks *init* 



- output\_transforms *init* 



- cache *init* 



- type *init* 



- compress *init* 



- abscissa *init* 



- output\_fn *init* 



- instrument *init* 



- min *init* 



- dim *init* 










Fields
------



- ABSCISSA\_DAP *ptr\_new()*


- CACHE *0L*


- COMPRESS *''*


- COMPRESS\_DATA\_P *ptr\_new()*


- DAP\_INDEX *0S*


- DATA\_DAP *ptr\_new()*


- DIM\_FN *''*


- DIM\_P *ptr\_new()*


- FILENAME *''*


- FILETYPE *''*


- GFFP *ptr\_new()*


- HEADER\_DAP *ptr\_new()*


- INPUT\_FN *''*


- INPUT\_KEYVALS\_P *ptr\_new()*


- INPUT\_TRANSFORMS\_P *ptr\_new()*


- INPUT\_TRANSLATORS\_P *ptr\_new()*


- INSTRUMENT *''*


- KEYWORD\_FN *''*


- LAST\_TRANSLATOR *[0L, 0L]*


- MAINTAIN *0B*


- MAX *0.0000000D*


- MIN *0.0000000D*


- ORDER\_DAP *ptr\_new()*


- OUTPUT\_FN *''*


- OUTPUT\_KEYVALS\_P *ptr\_new()*


- OUTPUT\_TRANSFORMS\_P *ptr\_new()*


- OUTPUT\_TRANSLATORS\_P *ptr\_new()*


- SAMPLE\_DAP *ptr\_new()*


- SAMPLING\_FN *''*


- SIBLING\_DD\_H *0L*


- TRANSIENT\_KEYVALS\_P *ptr\_new()*


- TYPE *0B*


- UPDATE *0S*











Fields in OMINAS\_CORE
----------------------------------------------------------------------------------------------

ABBREV *''*

NAME *''*

TASKS\_P *ptr\_new()*

UDATA\_TLP *ptr\_new()*

USER *''*

\_\_PROTECT\_\_ASSOC\_XD *obj\_new()*





Fields in IDL\_OBJECT
----------------------------------------------------------------------------------------------

IDL\_OBJECT\_BOTTOM *0LL*

IDL\_OBJECT\_TOP *0LL*

\_\_OBJ\_\_ *obj\_new()*



















ominas\_data::init
________________________________________________________________________________________________________________________



`source <./`ominas_data__define.pro>`_

.. code:: IDL

 result = ominas_data::init(ii, end_keywords, crd=crd, dd=dd, abbrev=abbrev, user=user, name=name, tasks=tasks, udata=udata, uname=uname, assoc_xd=assoc_xd, filename=filename, min=min, max=max, dim=dim, cache=cache, type=type, gff=gff, data=data, abscissa=abscissa, nhist=nhist, header=header, filetype=filetype, input_fn=input_fn, output_fn=output_fn, keyword_fn=keyword_fn, instrument=instrument, input_translators=input_translators, output_translators=output_translators, input_transforms=input_transforms, output_transforms=output_transforms, maintain=maintain, compress=compress, tab_translators=tab_translators)










+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


Parameters
----------




ii
-----------------------------------------------------------------------------






end\_keywords
-----------------------------------------------------------------------------






+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




Keywords
--------


.. _crd
- crd 



.. _dd
- dd 



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
- filename 



.. _min
- min 



.. _max
- max 



.. _dim
- dim 



.. _cache
- cache 



.. _type
- type 



.. _gff
- gff 



.. _data
- data 



.. _abscissa
- abscissa 



.. _nhist
- nhist 



.. _header
- header 



.. _filetype
- filetype 



.. _input\_fn
- input\_fn 



.. _output\_fn
- output\_fn 



.. _keyword\_fn
- keyword\_fn 



.. _instrument
- instrument 



.. _input\_translators
- input\_translators 



.. _output\_translators
- output\_translators 



.. _input\_transforms
- input\_transforms 



.. _output\_transforms
- output\_transforms 



.. _maintain
- maintain 



.. _compress
- compress 



.. _tab\_translators
- tab\_translators 












- Lines 115
- McCabe complexity






ominas\_data\_\_define
________________________________________________________________________________________________________________________



`source <./`ominas_data__define.pro>`_

.. code:: IDL

 ominas_data__define



Description
-----------
	Structure defining the data descriptor.






















History
-------

 	Written by:	Spitale, 1/1998
 	Adapted by:	Spitale, 5/2016











- Lines 38
- McCabe complexity







- File attributes


- Modification date

Tue Oct 11 10:03:12 2016

-Lines


116








