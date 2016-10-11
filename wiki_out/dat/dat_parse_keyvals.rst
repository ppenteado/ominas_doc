dat\_parse\_keyvals.pro
===================================================================================================

`source <./`dat_parse_keyvals.pro>`_

























dat\_parse\_keyvals
________________________________________________________________________________________________________________________



`source <./`dat_parse_keyvals.pro>`_

.. code:: IDL

 result = dat_parse_keyvals(keyvals, keywords=keywords)



Description
-----------
	Parses an array strings containing keyword=value pairs.










Returns
-------

	Array of type keyval_struct containing the parsed keywords
	and values.  One element per input array element.


 STATUS:
	Complete










+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


Parameters
----------




keyvals
-----------------------------------------------------------------------------

*in* 

Array of strings of the form <keyword>=<value>.





+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




Keywords
--------


.. _keywords
- keywords 













History
-------

 	Written by:	Spitale











- Lines 40
- McCabe complexity







- File attributes


- Modification date

Mon Sep 19 07:42:22 2016

-Lines


27








