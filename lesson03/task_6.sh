#!/bin/bash

# 6. * Создать в директории для совместной работы поддиректорию для обмена файлами, 
# но чтобы удалять файлы могли только их создатели.

mkdir Developers/share_dir;
ls -ila Developers;
sudo chmod -R 2755 ./Developers/share_dir;
ls -ila Developers;

