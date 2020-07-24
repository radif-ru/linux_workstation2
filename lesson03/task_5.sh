#!/bin/bash

# 5. * Создать группу developer, несколько пользователей, входящих в эту группу. 
# Создать директорию для совместной работы. 
# Сделать так, чтобы созданные одними пользователями файлы могли изменять другие пользователи этой группы.

sudo groupadd developer;
sudo useradd dev_user1 -G developer;
sudo useradd dev_user2 -G developer;
sudo useradd dev_user3 -G developer;
cat /etc/passwd;
cat /etc/group;
mkdir Developers;
sudo chgrp -R developer Developers;
ls -ila;
sudo chmod -R 2775 Developers;

