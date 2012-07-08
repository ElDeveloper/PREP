#/bin/bash
COMP_FN=prep.tar.gz

# solo para OS X
curl -0 http://prep.eluniversal.com.mx/prep/20120702_2000-listaActas.tar.gz -o ${COMP_FN}
tar zxvf ${COMP_FN}
rm -f ${COMP_FN}

# total de casillas 
echo Total de casillas: `cat presidente.txt | wc -l`

# numero de irregularidades y tipo
cat presidente.txt | awk 'FS="|" { if (NR > 6) {print $25}}'| sort | uniq -c

# irregularidades por estado 
cat presidente.txt | awk 'FS="|" { if (NR > 6 && $25 == "Excede lista nominal") {print $1}}' >> excede_por_estado.txt

# particpacion por estado
cat presidente.txt | awk 'FS="|" { if (NR > 6 && $23 != " "){ print $1"," $23"," $24 } }' >> participacion_por_estado.txt
