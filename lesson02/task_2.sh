# 2. Выяснить, для чего предназначена команда cat. 
# Используя данную команду, создайте два файла с данными, 
# а затем объедините их в один. 
# Просмотрите содержимое созданного файла. Переименуйте файл, дав ему новое имя.

echo "input file1 text:";
cat > file1;
echo "input file2 text";
cat > file2; cat file1 | cat > file3;
cat file2 | cat >> file3;
echo "file3:";
cat file3;
mv file3 new_name_file3
