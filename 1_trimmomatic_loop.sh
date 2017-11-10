#Load modules
module load trimmomatic
module load fastqc

#Make the base
for filename in *R1_001.fastq.gz
do
# first, make the base by removing *R1_001.fastq.gz
      base=$(basename $filename .fastq.gz)
      echo $base

 # now, construct the R2 filename by replacing 1 with 2
      base2=${base/R1/R2}
      echo $base2

 # run trimmomatic
trimmomatic PE ${base}.fastq.gz ${base2}.fastq.gz\  ${base}.qc.fq ${base}_s1_se ${base2}.qc.fq ${base2}_s2_se\ SLIDINGWINDOW:3:28

done
