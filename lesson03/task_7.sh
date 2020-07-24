#!/bin/bash

# 7. * Создать директорию, в которой есть несколько файлов. 
# Сделать так, чтобы открыть файлы можно только, зная имя файла, а через ls список файлов посмотреть нельзя.

mkdir new_dir2;
echo 'asfas' > new_dir2/1;
echo 'adsfssfas' > new_dir2/2;
echo 'adssdfsdffssfas' > new_dir2/3;
chmod 111 new_dir2;

