#!/bin/bash

##This is a slurm job file that checks heterozygosity reads to look for contamination

##NECESSARY JOB SPECIFICATIONS
#SBATCH --job-name=CheckHets
#SBATCH --time=01:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=2
#SBATCH --mem=2G
#SBATCH --output=/scratch/user/u.gw200825/ScHH_3RAD/vcf_filtering/CheckHets.%j

module load GCC/11.3.0
module load GCC/12.2.0
module load VCFtools/0.1.16

cd /scratch/user/u.gw200825/ScHH_3RAD

../scripts/checkHetsIndvVCF.sh ./populations/unfiltered/populations.snps.vcf
