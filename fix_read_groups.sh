module load picard-tools/2.15.0

picard AddOrReplaceReadGroups \
I=NAD101_pe_sorted.bam \
O=NAD101_pe_sorted_readgroups.bam \
SORT_ORDER=coordinate \
RGPL=illumina \
RGLB=NAD101_pe \
RGID=NAD101_pe \
RGPU=NAD101_pe \
RGSM=NAD101_pe \
VALIDATION_STRINGENCY=LENIENT \
VERBOSITY=ERROR
