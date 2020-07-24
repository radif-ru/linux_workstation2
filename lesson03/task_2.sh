#!/bin/bash

# 2. Дать созданным файлам другие, произвольные имена. Создать новую символическую ссылку. 
# Переместить ссылки в другую директорию.

mkdir new_dir;
mv file2 file_2;
ln -s file_2 file_5;
mv file3 new_dir/file_3;
mv file4 new_dir/file_4;
mv file_5 new_dir/file_5
ls -ila;
ls -ila new_dir;
