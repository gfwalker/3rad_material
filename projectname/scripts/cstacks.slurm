#!/bin/bash

##This is a slurm job file that runs cstacks on ustacks output files using a population map

##NECESSARY JOB SPECIFICATIONS
#SBATCH --job-name=cstacks_lib2
#SBATCH --time=02:00:00
#SBATCH --nodes=1
#SBATCH --tasks=4
#SBATCH --mem=4G
#SBATCH --output=/scratch/user/u.gw200825/schh_3rad/stacks/default/lib2poor/cstacks.%j

#Executable Lines
module load GCC/12.2.0
module load OpenMPI/4.1.4
module load Stacks/2.64

#move to main ScHH directory
cd /scratch/user/u.gw200825/schh_3rad

#run cstacks
cstacks -P ./stacks/default/lib2poor -M ./popmap/lib2_catalog_popmap.txt -p 4

