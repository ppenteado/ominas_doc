dat\_detect\_instrument.pro
===================================================================================================

`source <./`dat_detect_instrument.pro>`_

























dat\_detect\_instrument
________________________________________________________________________________________________________________________



`source <./`dat_detect_instrument.pro>`_

.. code:: IDL

 result = dat_detect_instrument(label, udata, filetype, silent=silent)



Description
-----------
	Attempts to detect the instrument for a data set by calling the
	detectors in the instrument detectors table.










Returns
-------

	String giving the instrument, or 'DEFAULT' if none detected.


 STATUS:
	Complete










+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


Parameters
----------




label
-----------------------------------------------------------------------------






udata
-----------------------------------------------------------------------------

*in* 

	User data for the detectors.





filetype
-----------------------------------------------------------------------------

*in* 

Filetype from dat_detect_filetype.





+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




Keywords
--------


.. _silent
- silent *in* 

If set, messages will be suppressed.














History
-------

 	Written by:	Spitale











- Lines 41
- McCabe complexity







- File attributes


- Modification date

Tue Oct 11 10:03:12 2016

-Lines


27








