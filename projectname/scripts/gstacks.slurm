#!/bin/bash

##This is a slurm job file that uses process_radtags to demultiplex (demux) individuals using a barcode file

##NECESSARY JOB SPECIFICATIONS
#SBATCH --job-name=gstacks_M2
#SBATCH --time=02:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --mem=4G
#SBATCH --output=/scratch/user/u.gw200825/ScHH_3RAD/stacks/parameter_optimization/M2/gstacks.out.%j


#Executable Lines
module load GCC/12.2.0
module load OpenMPI/4.1.4
module load Stacks/2.64

#move to main ScHH directory
cd /scratch/user/u.gw200825/ScHH_3RAD

#Run gstacks
gstacks -P ./stacks/parameter_optimization/M2 -M ./popmap/schh_popmap.txt -t 4
