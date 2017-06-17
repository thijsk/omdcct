#OMDCCT
=============

This is a BURST coin plotter that generates optimized plot files<br>
without the need to run an optimizer after plotting.<br>

This plotter ONLY works on Linux as it uses the fallocate() system<br>
call to pre-allocate space in the file system to minimize fragmentation.<br>

This version was developed by:<br>
Author: Peter Kristolaitis <alter3d@alter3d.ca><br>
Donations:  BURST-WQ52-PUBY-N9WB-6J3DY<br>

This code has a long lineage, and is a fork of the [mdcct project by Mirkic7](https://github.com/Mirkic7/mdcct)<br>

Contributors in the lineage include:<br>
<br>
Author: Mirkic7 <mirkic7@hotmail.com><br>
Donations: BURST-RQW7-3HNW-627D-3GAEV<br>

Author: Niksa Franceschi <niksa.franceschi@gmail.com><br>
Donations: BURST-RQW7-3HNW-627D-3GAEV<br>

Author: dcct / Markus Tervooren <info@bchain.info><br>
Donations: BURST-R5LP-KEL9-UYLG-GFG6T<br>

Author: Cerr Janror <cerr.janror@gmail.com><br>
Donations: BURST-LNVN-5M4L-S9KP-H5AAC<br>


### Installing
    git clone https://github.com/alter3d/omdcct
    cd omdcct
    make

### Usage
###### Notes
    The file name will have a '.plotting' suffix while the file is incomplete, and then renamed to the
    standard format if plotting is successful.

###### For SSE4
    Usage:
```bash
./plot -k KEY [ -x CORE ] [-d DIRECTORY] [-s STARTNONCE] [-n NONCES] [-m STAGGERSIZE] [-t THREADS] [-a]
```
     CORE:
       0 - default core
       1 - SSE4 core
     -a = ASYNC writer mode (will use 2x memory!)

###### For AVX2
    Usage:
```bash
./plotavx2 -k KEY [ -x CORE ] [-d DIRECTORY] [-s STARTNONCE] [-n NONCES] [-m STAGGERSIZE] [-t THREADS] [-a]
```
      CORE:
        0 - default core
        1 - SSE4 core
        2 - AVX2 core
       -a = ASYNC writer mode (will use 2x memory!)
 
###### Not specifying -x option will default to original dcct ploter

