#!/bin/bash

##NECESSARY JOB SPECIFICATIONS
#SBATCH --job-name=gstacks_n3
#SBATCH --time=01:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --mem=4G
#SBATCH --output=/scratch/user/u.gw200825/schh_3rad/stacks/parameter_optimization/n3/gstacks.out.%j


#Executable Lines
module load GCC/12.2.0
module load OpenMPI/4.1.4
module load Stacks/2.64

#move to main ScHH directory
cd /scratch/user/u.gw200825/schh_3rad

#Run gstacks
gstacks -P ./stacks/parameter_optimization/n3 -M ./popmap/schh_popmap.txt -t 4
