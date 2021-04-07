#!/bin/bash -l

################### VASP Job Batch Script Example ###################
# Section for defining queue-system variables:
#-------------------------------------
# This script asks for 2 nodes and 64 cores (32 cpus per node).  
# Runtime for this job is 59 minutes; syntax is hh:mm:ss.
# partition and account should be set to your project, here "research" partition is being used
#-------------------------------------
# SLURM-section
#SBATCH --cluster=xcat
#SBATCH --partition=research
#SBATCH --account=research
#SBATCH --job-name=vasp_runex
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=32
#SBATCH --time=02:00:00
#SBATCH --output=vasp_runex.log

######################################
# Section for defining job variables and settings:

# We load all the default program system settings with module load:

module --quiet purge
module load compilers/intel/20.2 openmpi/intel/4.1.0-intel20 vasp/intel/6.1
# You may check other available versions with "module avail VASP"


#Don't forget to set this to 1, if you do not setup your run for OMP parallelization! 
export OMP_NUM_THREADS=1

# Running the program:

mpirun vasp_std

echo "Job finished at"
date
################### Job Ended ###################
exit 0
