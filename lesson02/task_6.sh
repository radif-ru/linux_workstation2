# 6. Запустить в одном терминале программу, в другом терминале посмотреть PID процесса 
# и остановить с помощью kill, посылая разные типы сигналов. Что происходит?

nano task_6.sh;
ps aux | grep nano | grep -v grep;
# kill 3883; -
# В данном случае pid процесса 3883, остановив его с помощью kill программа закрылась в другом терминале,
# без сохранения данных. Так как pid постоянно меняется, убьём процесс по имени:
killall nano; #-убьёт все процессы nano, pkill nano -убьёт первый процесс nano 
ps aux | grep nano | grep -v grep;
