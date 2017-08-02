#load modules
module load bwa
module load samtools

#create bases
for filename in *_R1_001.qc.fq
do
base=$(basename $filename .qc.fq)
echo $base

base2=${base/R1/R2}
echo $base2

#map
bwa mem -a -t 4 -M -R @RG"\t"ID:$base"\t"SM:$base"\t"PL:illumina"\t"LB:$base genome.fa ${base}.qc.fq ${base2}.qc.fq > ${base}_pe_aligned_reads.sam

wait

#convert to bam
echo "converting to bam"
samtools view -bS ${base}_pe_aligned_reads.sam > ${base}_pe.bam

wait

#sort
echo "sorting"
samtools sort ${base}_pe.bam > ${base}_pe_sorted.bam

wait

#index
echo "indexing - almost there!"
samtools index ${base}_pe_sorted.bam

#run flagstats
echo "get yo stats"
samtools flagstat ${base}_pe_sorted.bam
