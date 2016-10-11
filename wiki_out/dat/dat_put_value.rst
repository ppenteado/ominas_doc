dat\_put\_value.pro
===================================================================================================

`source <./`dat_put_value.pro>`_

























dat\_put\_value
________________________________________________________________________________________________________________________



`source <./`dat_put_value.pro>`_

.. code:: IDL

 dat_put_value, dd, keyword, value, end_keywords, trs=trs, status=status, tr_disable=tr_disable, tr_override=tr_override, tr_first=tr_first, tr_nosort=tr_nosort, key1=key1, key2=key2, key3=key3, key4=key4, key5=key5, key6=key6, key7=key7, key8=key8



Description
-----------
	Calls output translators, supplying the given keyword and value.













+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


Parameters
----------




dd
-----------------------------------------------------------------------------

*in* 

	Data descriptor.





keyword
-----------------------------------------------------------------------------

*in* 

Keyword to pass to translators, describing the
			requested quantity.





value
-----------------------------------------------------------------------------

*in* 

	Value to write through the translators.





end\_keywords
-----------------------------------------------------------------------------






+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




Keywords
--------


.. _trs
- trs *in* 

	Transient argument string.




.. _status
- status 

	0 if at least one translator call was successful,
			-1 otherwise.





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
- tr\_nosort 



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











- Lines 50
- McCabe complexity







- File attributes


- Modification date

Tue Oct 11 10:03:12 2016

-Lines


29








