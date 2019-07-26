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

#map, convert to bam, sort
bwa mem -a -t 4 -M -R @RG"\t"ID:$base"\t"SM:$base"\t"PL:illumina"\t"LB:$base genome_3.0.fna ${base}.qc.fq.gz ${base2}.qc.fq.gz | \
samtools view -bS | samtools sort > ${base}_pe_sorted.bam

#index
echo "indexing - almost there!"
samtools index ${base}_pe_sorted.bam

#run flagstats
echo "get yo stats"
samtools flagstat ${base}_pe_sorted.bam
