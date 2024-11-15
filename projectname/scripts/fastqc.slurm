#!/bin/bash

##This script runs fastqc on the decloned fastq files

##NECESSARY JOB SPECIFICATIONS
#SBATCH --job-name=fastqc          #Set the job name to "fastqc"
#SBATCH --time=01:00:00              #Set the wall clock time to 1hr
#SBATCH --ntasks=1                   #Request 1 task
#SBATCH --mem=4G                     #Request 4GB per node
#SBATCH --output=/scratch/user/u.gw200825/schh_3rad/qc_reports/lib2poor/fastqc.%j      #Send stdout/err to "fastqc.[jobID]"
#SBATCH --array=1-24                 #Array will split into 24 tasks with (8 samples each, specificed below)

#Executable Lines
module load GCC/11.3.0
module load OpenMPI/4.1.4
module load FastQC/0.11.9-Java-11

cd /scratch/user/u.gw200825/schh_3rad

#Set the number of runs that each SLURM task in the array will do
PER_TASK=8

#Calculate the start and end values for the current task
START_NUM=$(( ($SLURM_ARRAY_TASK_ID - 1) * $PER_TASK + 1 ))
END_NUM=$(( $SLURM_ARRAY_TASK_ID * $PER_TASK ))

#Print the task and run range:
echo This is task $SLURM_ARRAY_TASK_ID, which will do runs $START_NUM to $END_NUM

all_samples=( $(cut -f1 ./popmap/lib2_popmap.txt) )

#Run the loop of runs for this task
for (( run=$START_NUM; run<=END_NUM; run++ )); do
 echo This is task $SLURM_ARRAY_TASK_ID and run $run
 r1=./decloned_fastqs/lib2poor/${all_samples[$run-1]}.1.fq
 r2=./decloned_fastqs/lib2poor/${all_samples[$run-1]}.2.fq
 echo Generating FastQC reports for Read 1: $r1 and Read 2: $r2
 fastqc $r1 -o ./qc_reports/lib2poor
 fastqc $r2 -o ./qc_reports/lib2poor
done



