dat\_data.pro
===================================================================================================

`source <./`dat_data.pro>`_

























dat\_data
________________________________________________________________________________________________________________________



`source <./`dat_data.pro>`_

.. code:: IDL

 result = dat_data(dd, samples=samples, offset=offset, nd=nd, true=true, noevent=noevent, abscissa=abscissa)



Description
-----------
	Returns the data array associated with a data descriptor.










Returns
-------

	The data array associated with the data descriptor.


 STATUS:
	Complete


 SEE ALSO:
	dat_set_data










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


.. _samples
- samples *in* 

 Sampling indices.  If set, only these data elements are
		  returned.  May be 1D or the same number of dimensions as
		  the data array.




.. _offset
- offset 



.. _nd
- nd *in* 

      If set, the samples input is taken to be an ND coordinate
	          rather than a 1D subscript.  dat_data can normally tell
	          the difference automatically, but there is an ambiguity
	          if a single ND point is requested.  In that case, dat_data
	          interprets that as an array of 1D subscripts, unless /nd
	          is set.




.. _true
- true *in* 

    If set, the actual data array is returned, even if there is
	          a sampling function.




.. _noevent
- noevent 



.. _abscissa
- abscissa *in* 

If set, the abscissa array is returned instead of the data
		  array.














History
-------

 	Written by:	Spitale, 2/1998
 	Adapted by:	Spitale, 5/2016











- Lines 73
- McCabe complexity







- File attributes


- Modification date

Tue Oct 11 10:03:12 2016

-Lines


60








