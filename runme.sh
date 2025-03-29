rm -rf ./*.gz 2>>/dev/null

make gen 1>>//dev/null
make program 1>>/dev/null

./make_file 

./sparse -iA_FILE -oB_FILE

#Сжатие файлов
gzip -k A_FILE
gzip -k B_FILE

gzip -cd B_FILE.gz | ./sparse -oC_FILE

./sparse -iA_FILE -oD_FILE -b100

rm make_file sparse

stat A_FILE > result.txt
echo "----------------------------------------------------------------------" >> result.txt
stat A_FILE.gz >> result.txt
echo "----------------------------------------------------------------------" >> result.txt
stat B_FILE >> result.txt 
echo "----------------------------------------------------------------------" >> result.txt
stat B_FILE.gz >> result.txt
echo "----------------------------------------------------------------------" >> result.txt
stat C_FILE >> result.txt
echo "----------------------------------------------------------------------" >> result.txt
stat D_FILE >> result.txt