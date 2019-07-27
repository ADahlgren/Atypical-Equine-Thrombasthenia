module load delly/0.7.8

#-o = output file
#-g = path to reference genome
# list all bam files
delly call -g genome_3.0.fna -o delly_var.bcf 114_S1_L001_R1_001_pe_sorted_dedup.bam 11_S7_L007_R1_001_pe_sorted_dedup.bam 129_S5_L005_R1_001_pe_sorted_dedup.bam 12_S8_L008_R1_001_pe_sorted_dedup.bam
