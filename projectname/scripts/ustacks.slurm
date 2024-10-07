#!/bin/bash

##This is a slurm job file that runs ustacks

##NECESSARY JOB SPECIFICATIONS
#SBATCH --job-name=ustacks_n0
#SBATCH --time=00:30:00
#SBATCH --nodes=1
#SBATCH --tasks=1
#SBATCH --mem=2G
#SBATCH --output=/scratch/user/u.gw200825/ScHH_3RAD/stacks/parameter_optimization/n0/ustacks.%j
#SBATCH --array=1-24

#Executable Lines
module load GCC/12.2.0
module load OpenMPI/4.1.4
module load Stacks/2.64

#move to main ScHH directory
cd /scratch/user/u.gw200825/ScHH_3RAD

#Set the number of runs that each SLURM task in the array will do
PER_TASK=8

#Calculate the start and end values for the current task
START_NUM=$(( ($SLURM_ARRAY_TASK_ID - 1) * $PER_TASK + 1 ))
END_NUM=$(( $SLURM_ARRAY_TASK_ID * $PER_TASK ))

#Print the task and run range:
echo This is task $SLURM_ARRAY_TASK_ID, which will do runs $START_NUM to $END_NUM

all_samples=( $(cut -f1 ./popmap/schh_popmap.txt) )

#Run the loop of runs for this task
for (( run=$START_NUM; run<=END_NUM; run++ )); do
 echo This is task $SLURM_ARRAY_TASK_ID and run $run
 file=./decloned_fastqs/${all_samples[$run-1]}.1.fq
 echo This is sample $file
 ustacks -f $file -o ./stacks/parameter_optimization/M2 -M 2 -m 3 -i $run -t fastq -R
done
