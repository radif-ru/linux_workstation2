#!/bin/bash

# 9. *Заполните директории файлами вида ГГГГММДДНН.txt. 
# Внутри файла должно быть имя файла. Например 2018011301.txt, 2018011302.txt.

chmod ugo+x task_9.sh;

dir='Photos_Dir'

for year in {2015..2020}
do
for month in {01..12}
do
for day in {01..30}
do
echo $year$month$day.txt > ./$dir/$year/$month/$day.txt;
done
done
done
