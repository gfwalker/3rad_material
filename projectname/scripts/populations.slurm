#!/bin/bash

##This is a slurm job file that runs populations to output a vcf file from your stacks files

##NECESSARY JOB SPECIFICATIONS
#SBATCH --job-name=populations
#SBATCH --time=00:30:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=4G
#SBATCH --output=/scratch/user/u.gw200825/schh_3rad/stacks/optimized/vcfall/populations.%j


#Executable Lines
module load GCC/12.2.0
module load OpenMPI/4.1.4
module load Stacks/2.64

#move to main ScHH directory
cd /scratch/user/u.gw200825/schh_3rad

#run populations
populations -P ./stacks/parameter_optimization/n3 -M ./popmap/schh_popmap.txt -O ./stacks/optimized/vcfall -p 3 -r 0.8 --max-obs-het 0.75 --vcf-all
