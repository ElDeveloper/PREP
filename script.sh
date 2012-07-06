#/bin/bash
COMP_FN=prep.tar.gz

# solo para OS X
curl -0 http://prep.eluniversal.com.mx/prep/20120702_2000-listaActas.tar.gz -o ${COMP_FN}
tar zxvf ${COMP_FN}
rm -f ${COMP_FN}

# numero de irregularidades y tipo
cat presidente.txt | awk 'FS="|" { if (NR > 6) {print $25}}'| sort | uniq -c

# distribuciones 
cat presidente.txt | awk 'FS="|" { if (NR > 6 && $25 == "Excede lista nominal") {print $1}}' >> excede_por_estado.txt
