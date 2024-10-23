#!/bin/bash

##This is a slurm job file that runs sstacks

##NECESSARY JOB SPECIFICATIONS
#SBATCH --job-name=sstacks_n3
#SBATCH --time=01:00:00
#SBATCH --nodes=1
#SBATCH --tasks=1
#SBATCH --mem=4G
#SBATCH --output=/scratch/user/u.gw200825/schh_3rad/stacks/parameter_optimization/n3/sstacks.%j
#SBATCH --array=1-24

#Executable Lines
module load GCC/12.2.0
module load OpenMPI/4.1.4
module load Stacks/2.64

#move to main ScHH directory
cd /scratch/user/u.gw200825/schh_3rad

#Set the number of runs that each SLURM task in the array will do
PER_TASK=8

#Calculate the start and end values for the current task
START_NUM=$(( ($SLURM_ARRAY_TASK_ID - 1) * $PER_TASK + 1 ))
END_NUM=$(( $SLURM_ARRAY_TASK_ID * $PER_TASK ))

#Print the task and run range:
echo This is task $SLURM_ARRAY_TASK_ID, which will do runs $START_NUM to $END_NUM

#create array of sample prefixes from popmap
all_samples=( $(cut -f1 ./popmap/schh_popmap.txt) )

#loop over runs START_NUM to END_NUM aand run sstacks using the corresponding sample prefix
for (( run=$START_NUM; run<=END_NUM; run++ )); do
 echo This is task $SLURM_ARRAY_TASK_ID and run $run
 sample=./stacks/parameter_optimization/n3/${all_samples[$run-1]}
 sstacks -c ./stacks/parameter_optimization/n3 -s $sample -o ./stacks/parameter_optimization/n3
 echo $sample
done
