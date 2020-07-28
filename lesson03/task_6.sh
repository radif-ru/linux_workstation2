#!/bin/bash

# 6. * Создать в директории для совместной работы поддиректорию для обмена файлами, 
# но чтобы удалять файлы могли только их создатели.

mkdir shared/tmp/;
ls -ila shared/;
# sudo chmod -R 2755 ./shared/share_dir;
sudo chmod g+w,+t ./shared/tmp/;
ls -ila shared/;

