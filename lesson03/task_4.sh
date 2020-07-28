#!/bin/bash

# 4. Создать пользователя, обладающего возможностью выполнять действия от имени суперпользователя.

sudo useradd -m -G sudo -s /bin/bash newadmin;
cat /etc/group;
cat /etc/passwd;

