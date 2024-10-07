#!/bin/bash

##This script runs fastqc and multiqc on the decloned fastq files

##NECESSARY JOB SPECIFICATIONS
#SBATCH --job-name=QCreport          #Set the job name to "QCreport"
#SBATCH --time=02:00:00              #Set the wall clock time to 2hr
#SBATCH --ntasks=1                   #Request 1 task
#SBATCH --mem=8G                     #Request (8GB) per node
#SBATCH --output=/scratch/user/u.gw200825/ScHH_3RAD/qc_reports/QCreport.%j      #Send stdout/err to "QCreport.[jobID]"

#Executable Lines
module load FastQC/0.11.9-Java-11
module load MultiQC/1.14
cd /scratch/user/u.gw200825/ScHH_3RAD
fastqc ./decloned_fastqs/*.fq.gz -o ./qc_reports
multiqc ./qc_reports




