#!/bin/bash
module load GCC/11.3.0
module load GCC/12.2.0
module load VCFtools/0.1.16

cat /scratch/user/u.gw200825/ScHH_3RAD/popmap/schh_popmap.txt | grep GAL | cut -f1> /scratch/user/u.gw200825/ScHH_3RAD/popmap/GAL_samples.txt
cat /scratch/user/u.gw200825/ScHH_3RAD/popmap/schh_popmap.txt | grep FLA | cut -f1 > /scratch/user/u.gw200825/ScHH_3RAD/popmap/FLA_samples.txt
cat /scratch/user/u.gw200825/ScHH_3RAD/popmap/schh_popmap.txt | grep SEY | cut -f1 > /scratch/user/u.gw200825/ScHH_3RAD/popmap/SEY_samples.txt

vcftools --keep /scratch/user/u.gw200825/ScHH_3RAD/popmap/GAL_samples.txt --vcf ./populations.snps.vcf --out schh_GAL --recode
vcftools --keep /scratch/user/u.gw200825/ScHH_3RAD/popmap/FLA_samples.txt --vcf ./populations.snps.vcf --out schh_FLA --recode
vcftools --keep /scratch/user/u.gw200825/ScHH_3RAD/popmap/SEY_samples.txt --vcf ./populations.snps.vcf --out schh_SEY --recode
