#!/usr/bin/bash

##This is a slurm job file that reformats headers to remobe 1:N:0 and 2:N:0 from forward and reverse reads so that they can be properly paired by stakcks

##NECESSARY JOB SPECIFICATIONS
#SBATCH --job-name=header_reformat
#SBATCH --time=02:00:00
#SBATCH --nodes=1
#SBATCH --tasks=1
#SBATCH --mem=2G
#SBATCH --output=/scratch/user/u.gw200825/schh_3rad/stacks/header_reformat.%j

cd /scratch/user/u.gw200825/schh_3rad

for file in ./decloned_fastqs/*.fastq.gz;
 do
 gunzip $file
 unzipped=${file::-3}
 echo $unzipped
 sed -i 's/1\:N\:0\://g' $unzipped 
 sed -i 's/2\:N\:0\://g' $unzipped
done
