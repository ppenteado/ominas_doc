dat\_replicate.pro
===================================================================================================

`source <./`dat_replicate.pro>`_

























dat\_replicate
________________________________________________________________________________________________________________________



`source <./`dat_replicate.pro>`_

.. code:: IDL

 result = dat_replicate(dd, dim, fn=fn)



Description
-----------
	Replicates the given descriptor, producing an array of the given
	dimensions containing cloned versions of the input descriptor.










Returns
-------

	Array of the given dimensions containing cloned versions of the input
	data descriptor.


 STATUS:
	Complete










+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


Parameters
----------




dd
-----------------------------------------------------------------------------

*in* 

 Data deccriptor to replicate.





dim
-----------------------------------------------------------------------------

*in* 

 Dimensions of the result.





+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




Keywords
--------


.. _fn
- fn *in* 

Name of the cloning function.  Default is nv_clone.














History
-------

 	Written by:	Spitale











- Lines 18
- McCabe complexity







- File attributes


- Modification date

Mon Sep 19 07:42:22 2016

-Lines


5








