#!/bin/bash

##This is a slurm job file that runs cstacks on ustacks output files using a population map

##NECESSARY JOB SPECIFICATIONS
#SBATCH --job-name=cstacks_M2
#SBATCH --time=02:00:00
#SBATCH --nodes=1
#SBATCH --tasks=4
#SBATCH --mem=4G
#SBATCH --output=/scratch/user/u.gw200825/ScHH_3RAD/stacks/parameter_optimization/M2/cstacks.%j

#Executable Lines
module load GCC/12.2.0
module load OpenMPI/4.1.4
module load Stacks/2.64

#move to main ScHH directory
cd /scratch/user/u.gw200825/ScHH_3RAD

#make reduced popmap of 60 samples to make catalog with


#run cstacks
cstacks -P ./stacks/parameter_optimization/M2 -M ./popmap/catalog_popmap.txt -p 4 -n 1

