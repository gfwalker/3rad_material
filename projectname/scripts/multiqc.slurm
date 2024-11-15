#!/bin/bash

##This script runs multiqc to combine fastqc reports

##NECESSARY JOB SPECIFICATIONS
#SBATCH --job-name=multiqc          #Set the job name to "multiqc"
#SBATCH --time=00:30:00              #Set the wall clock time to 30min
#SBATCH --ntasks=2                   #Request 2 tasks
#SBATCH --mem=4G                     #Request 4GB per node
#SBATCH --output=/scratch/user/u.gw200825/schh_3rad/qc_reports/lib2poor/multiqc.%j      #Send stdout/err to "multiqc.[jobID]"

#Executable Lines
module load GCC/11.3.0
module load OpenMPI/4.1.4
module load FastQC/0.11.9-Java-11
module load MultiQC/1.14

cd /scratch/user/u.gw200825/schh_3rad

multiqc ./qc_reports/lib2poor -o ./qc_reports/lib2poor
