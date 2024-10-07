#!/bin/bash

##This is a slurm job file that creates summary statistics of 3RAD data to help set filters for vcftools

##NECESSARY JOB SPECIFICATIONS
#SBATCH --job-name=vcf_stats
#SBATCH --time=02:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --mem=4G
#SBATCH --output=/scratch/user/u.gw200825/ScHH_3RAD/vcf_filtering/vcf_stats.%j

#Executable Lines
module load GCC/11.3.0
module load GCC/12.2.0
module load VCFtools/0.1.16

cd /scratch/user/u.gw200825/ScHH_3RAD

VCFFILE=./populations/r0.9_maf0.05_het0.7/populations.snps.vcf
OUT=./r0.9_maf0.05_het0.7

vcftools --vcf $VCFFILE --freq2 --out $OUT --max-alleles 2
vcftools --vcf $VCFFILE --depth --out $OUT
vcftools --vcf $VCFFILE --site-mean-depth --out $OUT
vcftools --vcf $VCFFILE --site-quality --out $OUT
vcftools --vcf $VCFFILE --missing-indv --out $OUT
vcftools --vcf $VCFFILE --missing-site --out $OUT
vcftools --vcf $VCFFILE --het --out $OUT

