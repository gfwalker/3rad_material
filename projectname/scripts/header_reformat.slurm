#!/usr/bin/bash

##This is a slurm job file that reformats headers to remobe 1:N:0 and 2:N:0 from forward and reverse reads so that they can be properly paired by stakcks

##NECESSARY JOB SPECIFICATIONS
#SBATCH --job-name=header_reformat
#SBATCH --time=01:00:00
#SBATCH --nodes=1
#SBATCH --tasks=1
#SBATCH --mem=2G
#SBATCH --output=/scratch/user/u.gw200825/schh_3rad/decloned_fastqs/lib2poor/header_reformat.%j
#SBATCH --array=1-24                 #Array will split into 24 tasks with (8 samples each, specificed below)

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
 r1=./decloned_fastqs/lib2poor/${all_samples[$run-1]}.1.fq.gz
 r2=./decloned_fastqs/lib2poor/${all_samples[$run-1]}.2.fq.gz
 echo reformatting Read 1: $r1 and Read 2: $r2
 gunzip $r1 
 unzipped=${r1::-3}
 echo $unzipped
 sed -i 's/1\:N\:0\://g' $unzipped
 gunzip $r2
 unzipped=${r2::-3}
 sed -i 's/2\:N\:0\://g' $unzipped
done
######

