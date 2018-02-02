#Load Picard Tools
module load picard-tools/2.6.0

#create bases
for filename in *_sorted.bam
do
base=$(basename $filename .bam)
echo $base

#remove PCR duplicates 
picard MarkDuplicates INPUT=${base}.bam OUTPUT=${base}_dedup.bam METRICS_FILE=${base}_metrics.txt REMOVE_DUPLICATES=true

done
