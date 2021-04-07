
Storage and backup
==================


Available file system
---------------------


* Global accessible home area (user area):            /home        (5 TB)


Home area
---------

The file system for user home directories on Dilhan. It is a 64 TB global file
system, which is accessible from both the login nodes and all the compute
nodes. The size of the home directory's for each user is 300 GB. It is not
possible to extend the size. If you need more space, consider using
/global/work (see below).

The home area is for "permanent" storage only, so please do not use it for
temporary storage during production runs. Jobs using the home area for scratch
files while running may be killed without any warning.


Work/scratch areas
------------------

.. warning::
   In all scratch areas, auto cleanup affecting all files
   older than 21 days will be implemented.



There is no backup of files stored.




Closing of user account
-----------------------

User accounts on Dilhan are closed on request from department or the
project leader. The account is closed in a way so that the user no
longer can log in.


Privacy of user data
--------------------

General privacy

There is a couple of things you as a user, can do to minimize the risk
of your data and account on Dilhan being read/accessed from the outside
world.

#. Your account on Dilhan is personal, do not give away your password to
   anyone, not even the HPC staff.
#. If you have configured ssh-keys on your local computer, do not use
   passphrase-less keys for accessing Dilhan.

By default a new account on Dilhan is readable for everyone on the
system. That is both /home/ and /global/work/

This can easily be change by the user using the command chmod The chmod
have a lot "cryptic" combinations of options (`click here for a more in
depth explanation <https://en.wikipedia.org/wiki/Chmod>`_ ). the most
commonly used is:

*  only user can read their home directory::

      chmod 700 /home/$USER

*  User and their group can read and execute files on the home directory::

      chmod 750 /home/$USER

*  User and all others including the group can read and execute the files::

      chmod 755 /home/$USER

*  everybody can read, execute, and WRITE to directory::

      chmod 777 /home/$USER


Management of lage files (> 200GB)
----------------------------------

Some special care needs to be taken if you want to create very large
files on the system. With large we mean file sizes over 200GB.

The /global/work file system (and /global/home too) is served by a
number of storage arrays that each contain smaller pieces of the file
system, the size of the chunks are 2TB (2000GB) each. In the default
setup each file is contained within one storage array so the default
filesize limit is thus 2TB. In practice the file limit is considerably
smaller as each array contains a lot of files.

Each user can change the default placement of the files it creates by
striping files over several storage arrays. This is done with the
following command::

  lfs setstripe -c 4 .

After this has been done all new files created in the current directory
will be spread over 4 storage arrays each having 1/4th of the file. The
file can be accessed as normal no special action need to be taken. When
the striping is set this way it will be defined on a per directory basis
so different directories can have different stripe setups in the same file
system, new subdirectories will inherit the striping from its parent at the
time of creation.

We recommend users to set the stripe count so that each chunk will be
approx. 200-300GB each, for example

========== ============ ========================
File size  Stripe count Command
========== ============ ========================
500-1000GB 4            ``lfs setstripe -c 4 .``
1TB - 2TB  8            ``lfs setstripe -c 8 .``
========== ============ ========================

Once a file is created the stripe count cannot be changed. This is
because the physical bits of the data already are written to a certain
subset of the storage arrays. However the following trick can used after
one has changed the striping as described above::

  $ mv file file.bu
  $ cp -a file.bu file
  $ rm file.bu

The use of ``-a`` flag ensures that all permissions etc are preserved.


Management of many small files (> 10000)
----------------------------------------

The file system on Dilhan is designed to give good performance for large
files. This have some impact if you have many small files.

If you have thousands of files in one directory. Basic operations like
'ls' becomes very slow, there is nothing to do about this. However
directories containing many files may cause the backup of the data to
fail. It is therefore highly recommended that if you want backup of the
files you need to use 'tar' to create on archive file of the directory.


.. _file_compression:

Compression of data
-------------------

Data which is not accessed frequently like results of finished projects
should be compressed in order to reduce storage space.

We recommend ``xz`` and ``tar`` to compress single files or whole folder
structures. To compress a single file::

  $ xz file

To decompress::

  $ xz --decompress file

To create a archive multiple files or folder::

  $ tar cfJv archive.tar.xz files

It is recommended to use the file suffix ``.tar.xz`` to make it clear
that archive was compressed with ``xz``.

To extract a archive (use ``-C folder`` to extract the files in
folder)::

  $ tar xvf archive.tar.xz


Binary data and endianness
--------------------------

Dilhan is like all desktop PCs a little endian computer.

The best work around for file compatibility is to save your file in a portable file
format like `netCDF <https://www.unidata.ucar.edu/software/netcdf/>`_ or
`HDF5 <https://www.hdfgroup.org/>`_.

Both formats are supported on Dilhan, but you have to load its modules
to use them::

  $ module load netCDF

Or::

  $ module load HDF5
