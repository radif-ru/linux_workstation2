

# Подсветка в .bashrc

https://github.com/magicmonty/bash-git-prompt

# Альтернативный вариант
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$(parse_git_branch)\[\033[00m\] $ "


# Статус репозитория
git status

# Добавить всё
git add -A

# Работа с ветками
git branch feature

# Создание и переход в ветку одной командой
git checkout -b new

git branch

# Переходим в неё
git checkout feature

#
git checkout master

git add .

git commit -m 'Add new file1'

# Выливка изменений на Github
git push origin master

git remote -v


# Сливаем измнения между ветками с конфликтом
git pull

git checkout feature

git merge master

git log

nano test

git add .

git merge master

git checkout master

git merge feature

git push origin master

git checkout feature

# Выливаем ветку в Github
git push -u origin feature

# Откат изменений
git revert [commit ID 7 first chars]

git status

# Создать ветку от кокретного коммента
git checkout -b feature2 [commit ID 7 first chars]

cd .git/hooks
cat > pre-commit
#!/bin/bash

echo "Hello buddy!!!"

chmod +x pre-commit









