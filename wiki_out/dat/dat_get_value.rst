dat\_get\_value.pro
===================================================================================================

`source <./`dat_get_value.pro>`_

























dat\_get\_value
________________________________________________________________________________________________________________________



`source <./`dat_get_value.pro>`_

.. code:: IDL

 result = dat_get_value(dd, keyword, end_keywords, status=status, trs=trs, tr_disable=tr_disable, tr_override=tr_override, tr_first=tr_first, tr_nosort=tr_nosort, key1=key1, key2=key2, key3=key3, key4=key4, key5=key5, key6=key6, key7=key7, key8=key8)



Description
-----------
	Calls input translators, supplying the given keyword, and builds
	a list of returned descriptors.










Returns
-------

	Array of descriptors returned from all successful translator calls.
	Descriptors are returned in the same order that the corresponding
	translators were called.  Each translator may produce multiple
	descriptors.


 STATUS:
	Complete










+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


Parameters
----------




dd
-----------------------------------------------------------------------------

*in* 

	Data descriptors.  Must all have the same instrument
			string.





keyword
-----------------------------------------------------------------------------

*in* 

Keyword to pass to translators, describing the
			requested quantity.





end\_keywords
-----------------------------------------------------------------------------






+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




Keywords
--------


.. _status
- status 

	0 if at least one translator call was successful,
			-1 otherwise.





.. _trs
- trs *in* 

	Transient argument string.




.. _tr\_disable
- tr\_disable *in* 

If set, dat_get_value returns without performing
			any action.




.. _tr\_override
- tr\_override *in* 

Comma-delimited list of translators to use instead
			of those stored in dd.




.. _tr\_first
- tr\_first *in* 

If set, dat_get_value returns after the first
			successful translator.




.. _tr\_nosort
- tr\_nosort *in* 

By default, output descriptors are sorted to remove
			those with duplicate names, retaining only the first
			descriptor of a given name for each input data
			descriptor.  /tr_nosort disables this action.




.. _key1
- key1 



.. _key2
- key2 



.. _key3
- key3 



.. _key4
- key4 



.. _key5
- key5 



.. _key6
- key6 



.. _key7
- key7 



.. _key8
- key8 













History
-------

 	Written by:	Spitale
 	Adapted by:	Spitale, 5/2016











- Lines 83
- McCabe complexity







- File attributes


- Modification date

Tue Oct 11 10:03:12 2016

-Lines


62








