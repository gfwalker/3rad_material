#!/bin/bash


##NECESSARY JOB SPECIFICATIONS
#SBATCH --job-name=align_stacks
#SBATCH --time=00:15:00
#SBATCH --nodes=1
#SBATCH --ntasks=32
#SBATCH --mem=8G
#SBATCH --output=/scratch/user/u.gw200825/ScHH_3RAD/integrated/align_stacks.%j


#Executable Lines
module load GCC/10.3.0
module load GCC/8.3.0
module load GCCcore/11.2.0
module load GCCcore/11.3.0
module load BWA/0.7.17

#move to main ScHH directory
cd /scratch/user/u.gw200825/ScHH_3RAD

#Index the reference genome
#bwa index ./reference/GCA_024679065.1_ASM2467906v1_genomic.fna  -p s.mokarran
#Run bwamem
bwa mem ./reference/s.mokarran  ./stacks/parameter_optimization/M3/catalog.fa.gz -t 32 > ./integrated/aligned.catalog.schh.sam


module load GCC/13.3.0
module load SAMtools/1.20
samtools view ./integrated/aligned.catalog.schh.sam -h -b > ./integrated/aligned.catalog.schh.bam
