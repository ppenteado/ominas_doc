dat\_dim.pro
===================================================================================================

`source <./`dat_dim.pro>`_

























dat\_dim
________________________________________________________________________________________________________________________



`source <./`dat_dim.pro>`_

.. code:: IDL

 result = dat_dim(dd, true=true, noevent=noevent)



Description
-----------
	Returns the dimensions of the data array in the given data
	descriptor.










Returns
-------

	Array giving the dimensions of the data in the data descriptor.


 STATUS:
	Complete










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


.. _true
- true *in* 

If set, the dimension function is not called and the true
	 	dimensions of the dat are returned.




.. _noevent
- noevent 













History
-------

 	Written by:	Spitale
 	Adapted by:	Spitale, 5/2016











- Lines 21
- McCabe complexity







- File attributes


- Modification date

Mon Sep 19 07:42:22 2016

-Lines


8








