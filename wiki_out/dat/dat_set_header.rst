dat\_set\_header.pro
===================================================================================================

`source <./`dat_set_header.pro>`_

























dat\_set\_header
________________________________________________________________________________________________________________________



`source <./`dat_set_header.pro>`_

.. code:: IDL

 dat_set_header, dd, header, silent=silent, update=update, noevent=noevent



Description
-----------
	Replaces the header array associated with a data descriptor.













+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


Parameters
----------




dd
-----------------------------------------------------------------------------

*in* 

Data descriptor.





header
-----------------------------------------------------------------------------

*in* 

New header array.





+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




Keywords
--------


.. _silent
- silent *in* 

If set, messages are suppressed.




.. _update
- update *in* 

Update mode flag.  If not given, in will be taken from dd.




.. _noevent
- noevent 













History
-------

 	Written by:	Spitale, 2/1998
 	Adapted by:	Spitale, 5/2016











- Lines 29
- McCabe complexity







- File attributes


- Modification date

Mon Sep 19 07:42:22 2016

-Lines


16








