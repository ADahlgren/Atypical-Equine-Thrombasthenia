module load delly

#-o = output file
#-g = path to reference genome
# list all bam files
delly -o delly_all_var.vcf -g /share/finnolab/adahl/equCab2_UCSC_BWAIndex/genome.fa *_dedup.bam
