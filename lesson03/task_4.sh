#!/bin/bash

# 4. Создать пользователя, обладающего возможностью выполнять действия от имени суперпользователя.

sudo useradd vasya -G root,sudo;
cat /etc/group;
cat /etc/passwd;

