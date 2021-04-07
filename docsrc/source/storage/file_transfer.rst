.. _file_transfer:

=================================
Transferring files to/from Dilhan
=================================

Only ssh type of access is open to Dilhan. Therefore to upload or
download data only scp and sftp can be used.

To transfer data to and from Dilhan use the following address:

::

    144.122.31.1

This address has nodes with 10Gb network interfaces.

Basic tools (scp, sftp)

Standard scp command and sftp clients can be used:

::

    ssh 144.122.31.1
    ssh -l <username> 144.122.31.1

    sftp 144.122.31.1
    sftp <username>@144.122.31.1

Mounting the file system on you local machine using sshfs
---------------------------------------------------------
For linux users::

    sshfs [user@]144.122.31.1:[dir] mountpoint [options]

eg.::

    sshfs steinar@144.122.31.1:  /home/steinar/Dilhan-fs/

Windows users may buy and install
`expandrive <https://www.expandrive.com/windows>`_.



Subversion and rsync
--------------------
The tools subversion and rsync is also available for transferring files.
