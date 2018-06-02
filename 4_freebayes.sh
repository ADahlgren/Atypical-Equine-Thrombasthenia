module load freebayes/1.2.0

#call variants via haplotype
#-f reference location
#-L txt file of bam file names
freebayes -f genome.fa -L dedup_bams.txt > all_var.vcf
