dat\_detect\_filetype.pro
===================================================================================================

`source <./`dat_detect_filetype.pro>`_

























dat\_detect\_filetype
________________________________________________________________________________________________________________________



`source <./`dat_detect_filetype.pro>`_

.. code:: IDL

 result = dat_detect_filetype(filename, silent=silent, default=default, all=all, action=action)



Description
-----------
	Attempts to detect the type of the given file by calling the
	detectors in the filetype detectors table.










Returns
-------

	String giving the filetype, or null string if none detected.


 STATUS:
	Complete










+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


Parameters
----------




filename
-----------------------------------------------------------------------------

*in* 

Name of file to test.





+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




Keywords
--------


.. _silent
- silent *in* 

If set, messages will be suppressed.




.. _default
- default *in* 

If set, the 'default' filetype is returned.
			The default filetype is the first item in the table
			whose action is not 'IGNORE'.




.. _all
- all *in* 

If set, all filetypes in the table are returned.




.. _action
- action 













History
-------

 	Written by:	Spitale











- Lines 49
- McCabe complexity







- File attributes


- Modification date

Tue Oct 11 10:03:12 2016

-Lines


35








