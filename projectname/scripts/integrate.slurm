#!/bin/bash


##NECESSARY JOB SPECIFICATIONS
#SBATCH --job-name=integrate
#SBATCH --time=04:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=2
#SBATCH --mem=4G
#SBATCH --output=/scratch/user/u.gw200825/ScHH_3RAD/stacks/integrated/integrate.%j


#Executable Lines
module load GCC/12.2.0
module load OpenMPI/4.1.4
module load Stacks/2.64

#move to main ScHH directory
cd /scratch/user/u.gw200825/ScHH_3RAD

#Run stacks-integrate-alignments
stacks-integrate-alignments --in-path ./stacks/parameter_optimization/M3 --bam-path ./stacks/integrated/aligned.catalog.schh.bam --out-path ./stacks/integrated/
