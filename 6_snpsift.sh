module load snpeff/4.3i

for filename in *.vcf
##use *.vcf.gz for whole vcf
do
base=$(basename $filename .vcf)
echo $base

#-f - input is vcf
# + indicates case, - indicated control; order taken from order of horses in vcf
snpsift caseControl -f ${base}.vcf "-+--++--++--------" > ${base}_cc.vcf

#predicts effect of variants
snpeff EquCab2.86 ${base}_cc.vcf > ${base}_cc_eff.vcf

#determine number of variants
grep -v "^##" ${base}_cc_eff.vcf | wc -l

#filter based on fisher's exact test with p<0.05
#CC_ALL - allelic model
snpsift filter -f ${base}_cc_eff.vcf "(CC_ALL<0.05)" > ${base}_cc_eff_0.05.vcf

#determine number of variants that had a p<0.05
grep -v "^##" ${base}_cc_eff_0.05.vcf | wc -l

done
