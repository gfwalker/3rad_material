#!/bin/bash

##This is a slurm job file that uses clone_filter to remove PCR duplicates

##NECESSARY JOB SPECIFICATIONS
#SBATCH --job-name=Clone_Filter      #Set the job name to "Clone_Filter""
#SBATCH --time=02:00:00              #Set the wall clock limit to 2hrn
#SBATCH --nodes=1		     #Request 1 node
#SBATCH --ntasks=2                   #Request 2 cores for each run
#SBATCH --mem=8G                     #Request 8GB per node
#SBATCH --output=/scratch/user/u.gw200825/ScHH_3RAD/decloned_fastqs/CloneFilterOut.%j   #Send stdout/err to "CloneFilterOut.[jobID]"
#SBATCH --array=1-24		     #Array will split into 24 tasks with (8 samples each, specificed below)


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
 r1=./demuxed_fastqs/${all_samples[$run-1]}.1.fastq.gz
 r2=./demuxed_fastqs/${all_samples[$run-1]}.2.fastq.gz
 echo Read 1 is $r1 and Read 2 is $r2
 clone_filter -1 $r1  -2 $r2 -o ./decloned_fastqs/ -D -i gzfastq --index_null --oligo_len_1 len 141 --oligo_len_2 len 141
done

