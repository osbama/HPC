.. _batch_system:

Batch system
============

The Dilhan system is a resource that is shared between many of users and to
ensure fair use everyone must do their computations by submitting jobs through
a batch system that will execute the applications on the available resources.

The batch system on Dilhan is `SLURM <https://slurm.schedmd.com/>`_ (Simple
Linux Utility for Resource Management.)


Creating a job script
---------------------

To run a job on the system you need to create a job script. A job script is a
regular shell script (bash) with some directives specifying the number of CPUs,
memory, etc., that will be interpreted by the batch system upon submission.

You can find job script examples in :ref:`job_script_examples`.

After you wrote your job script as shown in the examples, you can start it with::

   sbatch jobscript.sh


How to pass command-line parameters to the job script
-----------------------------------------------------

It is sometimes convenient if you do not have to edit the job script every time you want
to change the input file. Or perhaps you want to submit hundreds of jobs and
loop over a range of input files. For this it is handy to pass command-line
parameters to the job script.
For an overview of the different possible parameters, see :ref:`slurm_parameter`.

In SLURM you can do this::

  $ sbatch myscript.sh myinput myoutput

And then you can pick the parameters up inside the job script::

  #!/bin/bash

  #SBATCH ...
  #SBATCH ...
  ...

  # argument 1 is myinput
  # argument 2 is myoutput
  mybinary.x < ${1} > ${2}

For recommended sets of parameters see also :ref:`slurm_recommendations`.


Walltime
--------

We recommend you to be as precise as you can when specifying the
parameters as they will inflict on how fast your jobs will start to run.
We generally have these rules for prioritizing jobs:

#. Large jobs, that is jobs with high CPUcounts, are prioritized.
#. Short jobs take precedence over long jobs.
#. Use fairshare. This means that users with many jobs running will get a
   decreased priority compared to other users.

To find out whether all users within one project share the same priority, run::

  $ sshare -a -A nnNNNNk

For a given account (project) consider the column "RawShares". If the RawShares
for the users is "parent", they all share the same fairshare priority. If it is
a number, they have individual priorities.
