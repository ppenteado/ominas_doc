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
    
    Architecture
    ------------
    The following diagram illustrates the relationships among the
    various components of a OMINAS installation.

    .. image:: arch.png
    
    The core OMINAS code is completely independent of the source of
    the data and the type of file in which it is stored. Those details
    are configured based on the intended purpose of a particular
    OMINAS installation. For example, the Cassini ISS installation
    contains configuration code that reads and writes VICAR image
    files and SPICE kernels.

    The separation between the data processing and I/O is maintained
    by a portion of the OMINAS system called NV. NV uses
    application-specific configuration tables to determine how to
    transform ancillary data from external sources into the standard
    data objects recognized in OMINAS. NV is described in detail in
    nv_description.txt.
    
    The OMINAS object library defines and manipulates the the basic
    data objects used to describe the various entities -- cameras,
    planets, rings, etc., -- of interest to the user. The object
    library is described in lib_description.txt.

    The typical OMINAS user will operate at the command level, which
    consists of the image display program `TVIM`, the NV I/O commands `NV_READ`</a> and <a
      `NV_WRITE`, and a set of 
      programs based on the underlying object library and utility
      routines referred to as `PG <./com/pg/index.html>`.
    
   The graphical interface to OMINAS is called `GRIM <./gr/index.html>`.
      Although it's designed to
      be used along with the command line like a fancy TVIM, GRIM may be
      used on its own.
