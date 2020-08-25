# MySQL

# Устанавливаем
sudo apt-get install mysql-server mysql-client mysql-common php7.2-mysql

# Правим /etc/mysql/my.cnf:
bind-address=другой машины либо 0.0.0.0

# Рекомендуется в /etc/mysql/my.cnf:
[mysqld]
skip-character-set-client-handshake
character-set-server=utf8
init-connect='SET NAMES utf8'
collation-server=utf8_general_ci

# Выполняем предварительную настройку
mysql_secure_installation

# Заходим под root
mysql -u root -p

# Создаём базу данных и пользователя
CREATE DATABASE mydatabase;
CREATE USER 'user'@'localhost' IDENTIFIED BY 'password'; 
GRANT ALL PRIVILEGES ON mydatabase.* TO 'user'@'localhost' IDENTIFIED BY 'password'; 
FLUSH PRIVILEGES;

# Заходим пользователем user и вводим пароль:
mysql -u user -p

USE mydatabase;
Создаем таблицу
create table mytable (
  id int not null auto_increment,
  txt varchar(100),
  n int,
  primary key (id)
);

insert into mytable (txt,n) values('Wall Street',7);
insert into mytable (txt,n) values('5th Avenu',1);

select * from mytable;


# Apache 

# Устанавливаем
sudo apt install apache2

# Конфигурационные файлы, conf-available/conf-enabled
# Модули Apache2, mods-available и mods-enabled
# Виртуальные хосты, sites-available и sites-enabled

# Работаем с модулями
# Пример 1. Модуль активен server-status
# http://localhost/server-status

# Пример 2. Модуль установлен, но не активен info
# http://localhost/server-info
# Если мы посмотрим в mods-enabled, мы не найдем файл info, 
# но в mods-available он присутствует. Он установлен, но не активен.
sudo a2enmod info
sudo systemctl reload apache2

# Пример 3. Модуль не установлен php7
sudo apt-get -y install php7.2 libapache2-mod-php7.2 php7.2-mysql php7.2-curl php7.2-json

# Перезапускаем веб-сервер: 
$ sudo systemctl reload apache2

# Проверяем:
php -v

sudo cat >/var/www/html/info.php
<?php
phpinfo();
?>
Ctrl-D

# Проверяем: http://localhost/info.php.


# Apache многосайтовость по имени

# Переходим в папку доступных конфигураций
cd /etc/apache2/sites-available/
ll
 
# Создаём файлы конфигураций для новыйх сайтов
sudo cp 000-default.conf test.a.conf 
sudo cp 000-default.conf test.b.conf 
sudo cp 000-default.conf test.c.conf 
ll

# Редактируем конфигурацию:
# порт <VirtualHost *:8080>
# имя сервера ServerName test.a
# директория сайта DocumentRoot /var/www/test.a
sudo nano test.a.conf 
sudo nano test.b.conf 
sudo nano test.c.conf 
 
# Запрещаем дефолтную конфигурацию 
sudo a2dissite 000-default

# Разрешаем новые сайты
sudo a2ensite test.a
sudo a2ensite test.b
sudo a2ensite test.c
ll
 
# Создаём папки для новых сайтов
ll /var/www/
sudo cp -r /var/www/html /var/www/test.a
sudo cp -r /var/www/html /var/www/test.b
sudo cp -r /var/www/html /var/www/test.c
ll /var/www/

# Добавляем в hosts
127.0.0.1 test.a
127.0.0.1 test.b
127.0.0.1 test.c
sudo nano /etc/hosts

# Проверяем
ping test.a
ping test.b
ping test.c

# В заголовок индексной страницы вводим отличительный текст
sudo nano /var/www/test.a/index.html 
sudo nano /var/www/test.b/index.html 
sudo nano /var/www/test.c/index.html

# Меняем порт прослушивания на 8080 
sudo nano /etc/apache2/ports.conf

# Перезпускаем сервер 
sudo systemctl restart apache2


# Настройка проксирования nginx на виртуальные хосты Apache

sudo apt install nginx
ll /etc/nginx/

# Добавляем параметры для прокси в location /
proxy_pass localhost:8080;
proxy_set_header Host $host;
proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
proxy_set_header X-Real-IP $remote_addr;

sudo nano ../sites-available/default

# Перезагружаем конфигурацию 
sudo systemctl reload nginx


# Сетевой фильтр

# Рассмотрим подробнее команды iptables. Говоря в общем, iptables — утилита, 
# задающая правила для сетевого фильтра Netfilter и работающая в пространстве 
# ядра Linux.

man iptables

# -L — посмотреть список правил (можно указать цепочку, иначе выводятся все);
sudo iptables -L

# -P — установить политику по умолчанию для заданной цепочки;
sudo iptables -P INPUT DROP
# или
sudo iptables -P INPUT ACCEPT

# Политика по умолчанию задает порядок работы с пакетами, для которых нет ни 
# одного правила. Если в цепочке правил ни одно не подошло, в итоге применяется 
# действие по умолчанию, которое и задается политикой. Если правило подошло, 
# действие по умолчанию не выполняется.

# Цепочка — это набор правил, которые проверяются по пакетам поочередно 
# (напоминает язык программирования). В таблице filter видим цепочки INPUT, 
# FORWARD и OUTPUT. Но есть и другие таблицы (их нужно указывать явно): таблица 
# nat, когда нам необходима трансляция адресов и портов, и mangle — когда 
# требуется внести изменения в пакет (например, установить ttl в 64 и скрыть от 
# провайдера использование подключения как шлюза к собственной сети).

#Просмотреть цепочки для другой таблицы
iptables -t nat -L
      
# Обратите внимание: имеет значение порядок правил в цепочке. Сравните:
iptables -A INPUT -p tcp -j DROP
iptables -A INPUT -p tcp --dport=22 -j ACCEPT

# Простой пример конфигурации:

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

iptables -A INPUT -i lo -j ACCEPT 
iptables -A OUTPUT -o lo -j ACCEPT

iptables -A INPUT -p icmp -j ACCEPT
iptables -A OUTPUT -p icmp -j ACCEPT

# Локальные соединения с динамических портов
iptables -A OUTPUT -p TCP --sport 32768:61000 -j ACCEPT
iptables -A OUTPUT -p UDP --sport 32768:61000 -j ACCEPT

# Разрешить только те пакеты, которые мы запросили
iptables -A INPUT -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p UDP -m state --state ESTABLISHED,RELATED -j ACCEPT

# Но если работаем как сервер, следует разрешить и нужные порты
iptables -A INPUT -i eth0 -p TCP --dport 22 -j ACCEPT 
iptables -A OUTPUT -o eth0 -p TCP --sport 22 -j ACCEPT

# Сохранение и восстановление значений
iptables-save > ./iptables.rules
iptables-restore < ./iptables.rules


# Сохранение с помощью службы
sudo apt install iptables-persistent netfilter-persistent

netfilter-persistent save
netfilter-persistent start
