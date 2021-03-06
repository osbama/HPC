.. _vasp_on_dilhan:

================================
About the VASP install on Dilhan
================================

This page contains information related to the installation of VASP on Dilhan. Some of this is relevant also for self-compilation of the code, for those who want to give this a try.


VASP on Dilhan
--------------

Note that the VASP installation on Dilhan mainly follows the standard syntax introduced by the vASP team with their new installation scheme. Based on their system, we have added two binaries - as commented under.

If you do

.. code-block:: bash

        module avail VASP

on Dilhan, you will notice that, there are a number of available binaries for each submodule. This might appear confusing.


First; All versions of VASP is compiled with the support for maximally-localised Wannier functions and the Wannier90 program and also the MPI flag in FPP (-DMPI)


There are 3 different binaries in each VASP module, all compiled with the same FPP settings (mentioned below):

* vasp_std
* vasp_gam
* vasp_ncl


FPP settings for each binary
----------------------------

#. vasp_std is compiled with the following additional FPP flag(s): -DNGZhalf, it is the "standard" vasp binary. 
#. vasp_gam is compiled with the following additional FPP flag(s): -DNGZhalf -DwNGZhalf, it has optimizations for Gamma point only calculations
#. vasp_ncl is compiled with the following additional FPP flag(s): no modifcations in FPP settings, it is intended for non-collinear calculations. 

We would be happy to provide a copy of our build scripts (patches) upon request.

About memory allocation for VASP
--------------------------------

VASP is known to be potentially memory demanding. Quite often, you might experience to use less than the full number of cores on the node, but still all of the memory.

For core-count, node-count and amounts of memory on Dilhan, see :ref:`about_dilhan`.

There are two important considerations to make:

Make sure that you are using the SBATCH --exclusive flag in your run script.



