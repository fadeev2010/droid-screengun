# droid-screengun 
# Chef recipe

## Система автоматического создания скриншотов c сайтов по списку из файла.

screenshot_list - файл по умолчанию. В файле указать список адресов сайтов, через пробел название файла в котором сохранить скриншот.

Пример:
http://mail.ru mail1.jpg
https://google.com go2332.jpg

При первом запуске, руками запустить скрипт screengun.sh и задать пароль для псевдо терминала.

# Depends: 
 - imagemagick
 - gnome-core
 - xfce4
 - vnc4server
