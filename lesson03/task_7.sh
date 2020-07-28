 #!/bin/bash

# 7. * Создать директорию, в которой есть несколько файлов. 
# Сделать так, чтобы открыть файлы можно только, зная имя файла, а через ls список файлов посмотреть нельзя.

mkdir new_dir2/;
echo '111asfas' > new_dir2/1;
echo '222222adsfssfas' > new_dir2/2;
echo '3333adssdfsdffssfas' > new_dir2/3;
# chmod 111 new_dir2;
chmod -r new_dir2/;
echo '44444444444adssdfsdffssfas' > new_dir2/4;
ls -ila;
ls -ila new_dir2/;
cat new_dir2/1 new_dir2/2 new_dir2/3 new_dir2/4;

