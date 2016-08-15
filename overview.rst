
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
comparable to analogous code written in C.

Modularity
~~~~~~~~~~

OMINAS obeys object-oriented software concepts, so that it is
highly modular and relatively easy to modify. Although IDL
directly provides for an object-oriented architecture, that
packaged is not used in OMINAS, or reasons mainly having to do
with flexibility.

Generality
~~~~~~~~~~

OMINAS itself must not contain any code that is dependent upon
the particular instrument that generated the input data, or upon
the organization of the file in which the data resides. Because
IDL compiles code dynamically, this requirement is met in OMINAS
by allowing for external "user"-written configuration code that
contains all of the specifics of a particular data source.</p>

Scripting
~~~~~~~~~
OMINAS must maintain a lowest-level user interface that
operates from a command line so that analyses may be constructed
as command scripts. Such a capability is necessary in order for
jobs to be performed in batch mode with no user intervention.
Moreover, such a capability must not prevent the addition of a
more user-friendly graphical interface. OMINAS contains a
command level user interface known as `PG <./com/pg/index.html>`, which consists of a
number of IDL programs. Those programs may be combined into IDL
batch files and run autonomously. There is also a graphical
interface called `GRIM <./gr/index.html>`
(GRaphical Interface to oMinas).

