dat\_type.pro
===================================================================================================

`source <./`dat_type.pro>`_

























dat\_type
________________________________________________________________________________________________________________________



`source <./`dat_type.pro>`_

.. code:: IDL

 result = dat_type(dd, noevent=noevent)



Description
-----------
	Returns the type code associated with a data descriptor.










Returns
-------

	Integer giving the type.


 STATUS:
	This data descriptor functonality is not complete.  A 'type' field
 	needs to be added to the input functions similar to the 'dim' field.
	Then dat_read would include that argument in its call to input_fn and
	it should work.










+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


Parameters
----------




dd
-----------------------------------------------------------------------------

*in* 

Data descriptor.





+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




Keywords
--------


.. _noevent
- noevent 













History
-------

 	Written by:	Spitale
 	Adapted by:	Spitale, 5/2016











- Lines 19
- McCabe complexity







- File attributes


- Modification date

Mon Sep 19 07:42:22 2016

-Lines


6








