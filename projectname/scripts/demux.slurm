#!/bin/bash

##This is a slurm job file that uses process_radtags to demultiplex (demux) individuals using a barcode file

##NECESSARY JOB SPECIFICATIONS
#SBATCH --job-name=demux_pt1
#SBATCH --time=05:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --mem=2G
#SBATCH --output=/scratch/user/u.gw200825/ScHH_3RAD/demuxed_fastqs/demux_pt1.out.%j


#Executable Lines
module load GCC/12.2.0
module load OpenMPI/4.1.4
module load Stacks/2.64

#move to main ScHH directory
cd /scratch/user/u.gw200825/ScHH_3RAD

#Process radtags
# Remember to change input files each time you do a different plate

process_radtags -P -p ./raw_plates/plate1 -b ./barcodes/pt1_barcodes.txt -o ./demuxed_fastqs \
      -i gzfastq \
      --inline_inline --renz-1 xbaI --renz-2 ecoRI \
      --adapter_mm 2 \
      --adapter_1 AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC \
      --adapter_2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT \
      -c -q -r -D
