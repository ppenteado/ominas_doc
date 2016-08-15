
OMINAS Overview
===============

    
Introduction
------------

OMINAS is an IDL-based software environment for the reduction and
analysis of data taken by any space-based or Earth-based system.
It was written by Joseph Spitale (jnspitale@psi.edu) under the
direction of Carolyn Porco. Other contributers include Vance
Haemmerle, Matthew Tiscareno, John Weiss, Daiana DiNino, 
Paulo Penteado, Jackie Ryan and Mark Moretto.
Funding for its initial development was provided through the
Cassini mission.

Functional requirements
-----------------------

OMINAS development is guided by the following functional
requirements:

Portability
~~~~~~~~~~~

OMINAS should operate on as many UNIX-based platforms as
possible. This requirement is easily (though not trivially) met
using IDL. To date, OMINAS has been tested on Alpha/OSF,
Sun/Solaris, PC/Linux, and Mac/OS X. However, note that a
specific OMINAS configuration (see Architecture below) may
contain platform dependencies.
Note that it is desirable for OMINAS to remain backward compatible
to the earliest possible IDL version so that users are not forced
to upgrade.

Speed
~~~~~
OMINAS computational routines must be as fast as possible.
Although this requirement is the most difficult to meet using
IDL, through the use of massive array operations, every existing
routine in OMINAS operates at an acceptable speed, usually
comparable to analogous code written in C.</p>
