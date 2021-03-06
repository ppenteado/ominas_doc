; docformat = 'rst'
;==============================================================================
;+
;
;	User Installation Guide 
;	=======================
;
;	This guide will cover the installation of OMINAS and common issues with
;	configuration, as well as present some common errors and possible
;	solutions. Please see the section entitled `Troubleshooting` for more
;	information regarding installation issues with OMINAS.
;
;	Requirements
;	============
;	
;	Currently OMINAS requires IDL 8.2.3 or above, and a bash shell, on Linux or
;	Mac OS.
;	
;	To process images from a particular mission, that mission's kernels will
;	need to be available. The OMINAS installer can automatically download sets of
;	kernels for several missions (Cassini, Galileo, Voyager, Dawn).
;
;	OMINAS makes use of the NAIF Icy Toolkit to process SPICE kernels. The Icy
;	toolkit may optionally be obtained manually from 
;	`NAIF <https://naif.jpl.nasa.gov/naif/toolkit_IDL.html>`. However, the
;	installer utility provided with OMINAS can download and compile Icy
;	automatically. Installation of Icy is somewhat platform-dependent, so
;	troubleshooting information can be found in `Troubleshooting`.
;
;	Procedure
;	=========
;
;	1. Please ensure that OMINAS has been properly downloaded from the
;	`Github repository <https://github.com/ppenteado/ominas>` by entering
;	the following command at the terminal::
;
;	 git clone https://github.com/ppenteado/ominas
;
;	A local copy of the OMINAS source will be cloned automatically.
;
;	2. Configuration of OMINAS should be performed using the configuration
;	script, configure.sh, which is located in the top-level ominas directory.
;	This script can be run from the command line with::
;
;	 source configure.sh
;
;	3. A prompt will appear asking which packages should be installed. The
;	user should type the numbers of the desired packages separated by spaces.
;	We recomend, at a minimum, setting up packages 1, 2 and 3 (OMINAS Core, Demo and Icy).
;	To automatically download and setup all the packages, use the `all` option.
;
;	4. When setting up an individual kernel or data package (selections 4-13),
;	one can either provide a path for an existing directory containing the required files,
;	or tell the installer to download them.
;
;	5. Test the install of OMINAS has been completed correctly by running the
;	the following example scripts::
;
;	 ominas saturn_example.pro
;	 ominas jupiter_example.pro
;
;	6. A successful Icy installation can be tested with the following IDL
;	command from within an OMINAS IDL session::
;
;	 help, 'icy', /dlm
;
;	Some text on the installed version of Icy should be displayed. Additionally,
;	use the following command::
;
;	 print, cspice_tkvrsn('TOOLKIT')
;
;	The version of Icy should be printed. If both of these functions return
;	successfully, then Icy has been installed correctly.
;
;
; Example installationg walkthrough
; ================================= 
; 
; From a fresh account (that never had OMINAS, Icy or any IDL libraries setup
; before), for the 3 main packages (Core, Demo and Icy)::
; 
;   ;[ominas_test_8@cmp ~]$ git clone https://github.com/ppenteado/ominas.git
;   ;Cloning into 'ominas'...
;   ;Username for 'https://github.com': ppenteado
;   ;Password for 'https://ppenteado@github.com':
;   ;remote: Counting objects: 13377, done.
;   ;remote: Compressing objects: 100% (85/85), done.
;   ;remote: Total 13377 (delta 51), reused 71 (delta 34), pack-reused 13258
;   ;Receiving objects: 100% (13377/13377), 200.48 MiB | 8.10 MiB/s, done.
;   ;Resolving deltas: 100% (7628/7628), done.
;   ;Checking connectivity... done.
;   ;Checking out files: 100% (3479/3479), done.
;   
; At this point, a copy of OMINAS will be in a newly-created directory called
; ominas, under the current directory. Note that if a non-empty ominas directory
; was already present, git would notice it and refuse to download OMINAS into that
; directory.
; 
;  Now, getting into the ominas directory and running the installer::
;
;   ;[ominas_test_8@cmp ~]$ cd ominas/
;   ;[ominas_test_8@cmp ominas]$ source configure.sh
;   ;Detecting .bash_profile...
;   ;.bash_profile detected!
;   ;Detecting .bashrc...
;   ;.bashrc detected!
;   ;Using IDL at /usr/local/bin/idl
;   ;IDL Version 8.5.1 (linux x86_64 m64). (c) 2015, Exelis Visual Information Solutions, Inc., a subsidiary of Harris Corporation.
;   ;Installation number: XXXXXX.
;   ;Licensed for use by: XXXXXX
;   ;
;   ;Creating ~/.ominas directory
;   ;Creating ~/ominas_data directory
;   ;The setup will guide you through the installation of OMINAS
;   ;OMINAS files located in /home/ominas_test_8/ominas
;   ;
;   ;IDL Version 8.5.1 (linux x86_64 m64). (c) 2015, Exelis Visual Information Solutions, Inc., a subsidiary of Harris Corporation.
;   ;Installation number: XXXXX.
;   ;Licensed for use by: XXXXX
;   ;
;   ;% Compiled module: OMINAS_ICY_TEST.
;   ;Icy: Icy not found
;   ;Current OMINAS configuration settings
;   ;Required:
;   ;1) OMINAS Core  . . . . . . . . . . . . .  NOT CONFIGURED
;   ;Contains the OMINAS code. If you select only one
;   ;of the other packages, this will be included.
;   ;Optional packages:
;   ;2) Demo package . . . . . . . . . . . . .  NOT CONFIGURED
;   ;Contains the demo scripts and the data required
;   ;to run then.
;   ;These files are always present (in ominas/demo),
;   ;this option is to set up the environment so that
;   ;the demos can be run.
;   ;3) SPICE Icy  . . . . . . . . . . . . . .  NOT CONFIGURED
;   ;Library maintained by JPL's NAIF (Navigation and Ancillary
;   ;Information Facility, https://naif.jpl.nasa.gov/naif/toolkit.html,
;   ;required to use spacecraft / planetary kernel files.
;   ;
;   ;Mission Packages:
;   ;Kernels used for each mission's position and
;   ;pointing data. If you do not already have them,
;   ;an option to download them from PDS will be provided.
;   ;If you already have them, you will need to provide
;   ;the path to your kernel files.
;   ;Note: the NAIF Generic Kernels (one of the optional
;   ;data packages) are not required for the missions, they
;   ;already contain a copy the subset of the generic kernel
;   ;files they need.
;   ;4) Cassini . . . . . . . . . . . . . . . . NOT CONFIGURED
;   ;Subsetted, about 16 GB as of Dec/2016
;   ;5) Galileo (GLL) . . . . . . . . . . . . . NOT CONFIGURED
;   ;About 833 MB as of Dec/2016
;   ;6) Voyager . . . . . . . . . . . . . . . . NOT CONFIGURED
;   ;About 163 MB as of Dec/2016
;   ;7) Dawn  . . . . . . . . . . . . . . . . . NOT CONFIGURED
;   ;Subsetted, about 8 GB as of Jan/2017
;   ;Data:
;   ;8) NAIF Generic Kernels . . . . . . . . .  NOT CONFIGURED
;   ;About 22 GB as of Dec/2016
;   ;9) SEDR image data . . . . . . . . . . . . NOT CONFIGURED
;   ;10) TYCHO2 star catalog . . . . . . . . . . NOT CONFIGURED
;   ;About 161 MB download, 665 MB unpacked
;   ;11) SAO star catalog . . . . . . . . . . . NOT CONFIGURED
;   ;About 19 MB download, 70 MB unpacked
;   ;12) GSC star catalog . . . . . . . . . . . NOT CONFIGURED
;   ;13) UCAC4 star catalog . . . . . . . . . . NOT CONFIGURED
;   ;About 8.5 GB download
;   ;For more information, see
;   ;https://ppenteado.github.io/ominas_doc/demo/install_guide.html
;   ;Modify Current OMINAS configuration (Exit/Auto/Uninstall 1 2 ...)?  1 2 3
;   ;Settiing OMINAS Core...
;   ;OMINAS requires the NAIF Icy toolkit to process SPICE kernels.
;   ;Would you like to install Icy from the internet now? [y]
;   ;http://naif.jpl.nasa.gov/pub/naif/toolkit//IDL/PC_Linux_GCC_IDL8.x_64bit/packages/icy.tar.Z ~/ominas_data/icy.tar.Z
;   ;http://naif.jpl.nasa.gov/pub/naif/toolkit//IDL/PC_Linux_GCC_IDL8.x_64bit/packages/icy.tar.Z --localdir=/home/ominas_test_8/ominas_data/
;   ;
;   ;IDL Version 8.5.1 (linux x86_64 m64). (c) 2015, Exelis Visual Information Solutions, Inc., a subsidiary of Harris Corporation.
;   ;Installation number: XXXXXX.
;   ;Licensed for use by: XXXXXX
;   ;
;   ;% Compiled module: PP_WGETCL.
;   ;% Compiled module: PP_COMMAND_LINE_ARGS_PARSE.
;   ;% Loaded DLM: URL.
;   ;% Compiled module: PP_WGET__DEFINE.
;   ;util/downloader/ca-bundle.crt
;   ;% Compiled module: PARSE_URL.
;   ;downloading http://naif.jpl.nasa.gov/pub/naif/toolkit//IDL/PC_Linux_GCC_IDL8.x_64bit/packages/icy.tar.Z
;   ;% Compiled module: PP_READABLESIZE.
;   ;Content Length:  276.00000 B
;   ;% Compiled module: PP_PARSE_DATE.
;   ;% Compiled module: JULDAY.
;   ;Content Length:  43.669736 MB
;   ;% Compiled module: CALDAT.
;   ;Extracting Icy source files...
;   ;Compiling Icy...
;   ;Icy compiled. Log is at ~/.ominas/icy_make.log
;   ;writing /home/ominas_test_8/.ominas/ominas_setup.sh
;   ;‘/home/ominas_test_8/.ominas/ominas_setup.sh’ -> ‘/home/ominas_test_8/.ominas/ominas_setup_old.sh’
;   ;
;   ;
;   ;
;   ;
;   ;
;   ;
;   ;done with writing /home/ominas_test_8/.ominas/ominas_setup.sh
;   ;IDL Version 8.5.1 (linux x86_64 m64). (c) 2015, Exelis Visual Information Solutions, Inc., a subsidiary of Harris Corporation.
;   ;Installation number: XXXXXX.
;   ;Licensed for use by: XXXXXX
;   ;
;   ;% Compiled module: OMINAS_PATHS_ADD.
;   ;Checking to see if IDL paths need to be changed...
;   ;% Compiled module: IDLASTRO_DOWNLOAD.
;   ;% Compiled module: ROUTINE_EXISTS.
;   ;There are missing IDLAstro routines.
;   ;Auto installing
;   ;git clone https://github.com/wlandsman/IDLAstro.git /home/ominas_test_8/ominas_data/idlastro
;   ;Cloning into '/home/ominas_test_8/ominas_data/idlastro'...
;   ;remote: Counting objects: 1400, done.
;   ;remote: Compressing objects: 100% (7/7), done.
;   ;remote: Total 1400 (delta 1), reused 3 (delta 1), pack-reused 1392
;   ;Receiving objects: 100% (1400/1400), 11.63 MiB | 4.85 MiB/s, done.
;   ;Resolving deltas: 100% (556/556), done.
;   ;Checking connectivity... done.
;   ;IDLAstro path set in preferences:  <IDL_DEFAULT>:+/home/ominas_test_8/ominas_data/idlastro/pro
;   ;OMINAS paths set in IDL preferences
;   ;Icy path set in IDL preferences
;   ;OMINAS aliase set in /home/ominas_test_8/.bashrc.
;   ;OMINAS aliase set in /home/ominas_test_8/.bash_profile.
;   ;IDL Version 8.5.1 (linux x86_64 m64). (c) 2015, Exelis Visual Information Solutions, Inc., a subsidiary of Harris Corporation.
;   ;Installation number: 5502667.
;   ;Licensed for use by: NASA - Jet Propulsion Laboratory
;   ;
;   ;% Compiled module: OMINAS_ICY_TEST.
;   ;% Loaded DLM: ICY.
;   ;Icy: /home/ominas_test_8/ominas_data/icy/lib/icy.so
;   ;Current OMINAS configuration settings
;   ;Required:
;   ;1) OMINAS Core  . . . . . . . . . . . . .  CONFIGURED
;   ;Contains the OMINAS code. If you select only one
;   ;of the other packages, this will be included.
;   ;Optional packages:
;   ;2) Demo package . . . . . . . . . . . . .  CONFIGURED
;   ;Contains the demo scripts and the data required
;   ;to run then.
;   ;These files are always present (in ominas/demo),
;   ;this option is to set up the environment so that
;   ;the demos can be run.
;   ;3) SPICE Icy  . . . . . . . . . . . . . .  CONFIGURED
;   ;Library maintained by JPL's NAIF (Navigation and Ancillary
;   ;Information Facility, https://naif.jpl.nasa.gov/naif/toolkit.html,
;   ;required to use spacecraft / planetary kernel files.
;   ;
;   ;Mission Packages:
;   ;Kernels used for each mission's position and
;   ;pointing data. If you do not already have them,
;   ;an option to download them from PDS will be provided.
;   ;If you already have them, you will need to provide
;   ;the path to your kernel files.
;   ;Note: the NAIF Generic Kernels (one of the optional
;   ;data packages) are not required for the missions, they
;   ;already contain a copy the subset of the generic kernel
;   ;files they need.
;   ;4) Cassini . . . . . . . . . . . . . . . . NOT CONFIGURED
;   ;Subsetted, about 16 GB as of Dec/2016
;   ;5) Galileo (GLL) . . . . . . . . . . . . . NOT CONFIGURED
;   ;About 833 MB as of Dec/2016
;   ;6) Voyager . . . . . . . . . . . . . . . . NOT CONFIGURED
;   ;About 163 MB as of Dec/2016
;   ;7) Dawn  . . . . . . . . . . . . . . . . . NOT CONFIGURED
;   ;Subsetted, about 8 GB as of Jan/2017
;   ;Data:
;   ;8) NAIF Generic Kernels . . . . . . . . .  NOT CONFIGURED
;   ;About 22 GB as of Dec/2016
;   ;9) SEDR image data . . . . . . . . . . . . NOT CONFIGURED
;   ;10) TYCHO2 star catalog . . . . . . . . . . NOT CONFIGURED
;   ;About 161 MB download, 665 MB unpacked
;   ;11) SAO star catalog . . . . . . . . . . . NOT CONFIGURED
;   ;About 19 MB download, 70 MB unpacked
;   ;12) GSC star catalog . . . . . . . . . . . NOT CONFIGURED
;   ;13) UCAC4 star catalog . . . . . . . . . . NOT CONFIGURED
;   ;About 8.5 GB download
;   ;For more information, see
;   ;https://ppenteado.github.io/ominas_doc/demo/install_guide.html
;   ;Modify Current OMINAS configuration (Exit/Auto/Uninstall 1 2 ...)?  e
;   ;Setup has completed. It is recommended to restart your terminal session before using OMINAS.
;   ;You may want to try some of the tutorials at https://ppenteado.github.io/ominas_doc/demo/
;   
;   
; At this point, one can run a few tests of the enviroment::
; 
;   ;[ominas_test_8@cmp ominas]$ which ominas
;   ;alias ominas='/home/ominas_test_8/.ominas/ominas'
;   ;~/.ominas/ominas
;   ;[ominas_test_8@cmp ominas]$ which ominasde
;   ;alias ominasde='/home/ominas_test_8/.ominas/ominasde'
;   ;~/.ominas/ominasde
;
; Which shows both ominas and ominasde are defined. Use ominas to start and IDL
; session in which to use OMINAS, and ominasde to start an IDL DE session in
; which to use OMINAS.
; 
; Now, to check on the ominas_setup file, which sets the environment for the OMINAS
; core and all currently set packages (in this example, only Core, Demo and Icy are set)::
; 
;   ;[ominas_test_8@cmp ominas]$ cat ~/.ominas/ominas_setup.sh
;   ;#!/usr/bin/env bash
;   ;alias ominas=~/.ominas/ominas
;   ;alias ominasde=~/.ominas/ominasde
;   ;export OMINAS_DIR=/home/ominas_test_8/ominas
;   ;export DFLAG=true
;   ;source /home/ominas_test_8/ominas/config/ominas_env_def.sh
;   ;unset NV_Generic_kernels_DATA
;   ;unset NV_SEDR_DATA
;   ;unset NV_TYCHO2_DATA
;   ;unset NV_SAO_DATA
;   ;unset NV_GSC_DATA
;   ;unset NV_UCAC4_DATA
;
; Now, to check that the right environment is see from an OMINAS session::
;
;   ;[ominas_test_8@cmp ominas]$ ominas -e 'spawn,"env | grep NV"'
;   ;IDL Version 8.5.1 (linux x86_64 m64). (c) 2015, Exelis Visual Information Solutions, Inc., a subsidiary of Harris Corporation.
;   ;Installation number: XXXXX.
;   ;Licensed for use by: XXXXX
;   ;
;   ;NV_TRANSLATORS=/home/ominas_test_8/ominas/config/tab/translators.tab:/home/ominas_test_8/ominas/demo/data/translators.tab
;   ;NV_CONFIG=/home/ominas_test_8/ominas/config
;   ;NV_IO=/home/ominas_test_8/ominas/config/tab/io.tab
;   ;NV_SPICE=/home/ominas_test_8/ominas/config/spice
;   ;NV_ORBIT_DATA=/home/ominas_test_8/ominas/config/orb/
;   ;NV_ARRAY_DATA=/home/ominas_test_8/ominas/config/arr/dat/
;   ;NV_TRANSFORMS=/home/ominas_test_8/ominas/config/tab/transforms.tab:/home/ominas_test_8/ominas/demo/data/transforms.tab
;   ;NV_STATION_DATA=/home/ominas_test_8/ominas/config/stn/
;   ;NV_RING_DATA=/home/ominas_test_8/ominas/config/rings/
;   ;NV_FTP_DETECT=/home/ominas_test_8/ominas/config/tab/filetype_detectors.tab
;   ;NV_SPICE_KER=::/home/ominas_test_8/ominas/demo/data
;   ;NV_INS_DETECT=/home/ominas_test_8/ominas/config/tab/instrument_detectors.tab:/home/ominas_test_8/ominas/demo/data/instrument_detectors.tab
;   
; Now, to check that the OMINAS paths show up inside an OMINAS IDL session::
; 
;   ;[ominas_test_8@cmp ominas]$ ominas -e 'print,pref_get("IDL_PATH")'
;   ;IDL Version 8.5.1 (linux x86_64 m64). (c) 2015, Exelis Visual Information Solutions, Inc., a subsidiary of Harris Corporation.
;   ;Installation number: XXXXX.
;   ;Licensed for use by: XXXXX
;   ;
;   ;<IDL_DEFAULT>:+/home/ominas_test_8/ominas_data/idlastro/pro:+/home/ominas_test_8/ominas_data/icy/lib:+/home/ominas_test_8/ominas:+/home/ominas_test_8/ominas/util/xidl
;   ;[ominas_test_8@cmp ominas]$ ominas -e 'print,pref_get("IDL_DLM_PATH")'
;   ;IDL Version 8.5.1 (linux x86_64 m64). (c) 2015, Exelis Visual Information Solutions, Inc., a subsidiary of Harris Corporation.
;   ;Installation number: XXXXX.
;   ;Licensed for use by: XXXXX
;   ;
;   ;<IDL_DEFAULT>:+/home/ominas_test_8/ominas_data/icy/lib
;
; With this environment, one can run some demo scripts, such as::
; 
;   ;ominas saturn_example
;   ;ominas jupiter_example
;
;	Troubleshooting
;	===============
;
;	This section outlines several common sources of error which are due to
;	OMINAS not being configured correctly.
;
;	One of the most common configuration problems manifests as this error::
;
;	 % CSPICE_STR2ET: SPICE(NOLEAPSECONDS): [str2et_c->STR2ET->TTRANS] The variable that points to the leapseconds (DELTET/DELTA_AT)
;                  could not be located in the kernel pool.  It is likely that the leapseconds kernel has not been loaded via
;                  the routine FURNSH.
;
;	This error comes from the Icy toolkit. It specifically refers to the Leap
;	Second Kernel file, however, as the lsk is usually the first kernel which
;	is loaded, this error generally means that no kernels are being loaded.
;
;	You can check which kernels have been loaded by entering the following
;	IDL commands::
;
;	 cspice_ktotal, 'ALL', count
;	 for i=0,count-1 do begin & cspice_kdata,i,'ALL',file,type,source,handle,found & print,i,file & endfor
;	
;	A list will be populated with the currently loaded SPICE kernels, and
;	their load order. If no kernels are loaded, then it is likely that a bad
;	path was supplied to the kernel pools. Ensure that the kernel pool was
;	successfully entered into the environemnt by using the "env" command at
;	the terminal prompt. The kernel pool variable names follow a convention
;	like so: <MIS>_SPICE_<*K>, where <MIS> is the abbreviated mission name,
;	and <*K> is the type of kernel. Therefore, for Cassini, the IDL command::
;
;	 spawn,"env | grep CAS_SPICE"
;
;	will list the path to directories containing each type of Cassini kernel.
;	If the variables are not present, the easiest fix might be to run the OMINAS
;	installer again
;
;	 source configure.sh
;	 
;	From the ominas directory. Then, if the Cassini package shows as installed,
;	select that option at the menu (4), to uninstall it. You will be presented with
;	the possibility of preserving files the OMINAS installer previously downloaded,
;	or deleting them. After the uninstallation is complete, you will be returned to
;	the installer menu, and Cassini should show as not configured. Then select the Cassini
;	option to set it up again. 
;
;
;	In some cases, a demo script will run and no error will appear to occur,
;	but no pointing will be overlayed on the image. This error generally occurs
;	due to the PCK kernels not being loaded or the CK kernels not being loaded
;	in the correct order.
;
;
;	When the frame kernel (FK) is not being loaded correctly for an image,
;	Icy will return the following error::
;
;	 % CSPICE_PXFORM: SPICE(EMPTYSTRING): [pxform_c] String "from" has length zero.
;
;	If Icy is not installed, and a script is run, something similar to the
;	following error may occur::
;
;	 % Attempt to call undefined procedure: 'CSPICE_STR2ET'.
;
;	In general, the undefined procudure may have any cspice prefix. Icy is
;	either not configured correctly, or not installed. In IDL, check that
;	the Icy path has been added to the IDL path as follows::
;
;	 path = pref_get('IDL_PATH')
;	 print, path
;	 dlm_path = pref_get('IDL_DLM_PATH')
;	 print, dlm_path
;
;	The path variable should appear as a colon-separated list with
;	<IDL_DEFAULT> as the first entry. Check that both Icy and OMINAS
;	directories are added to the IDL_PATH, and that Icy is added to the
;	IDL_DLM_PATH. If either Icy or OMINAS are not present, the best way to fix
;	it probably is to get back into the OMINAS directory and run the configure.sh
;	script to uninstall/install the Core, Demo or Icy packages again.
;	
;-
;==============================================================================
;

pro install_guide
print,1
end