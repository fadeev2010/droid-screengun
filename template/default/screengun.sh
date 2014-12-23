#!/bin/bash

#server with a specific DISPLAY
vncserver :11 -geometry 1280x2556

# sleep 3
# killall google-chrome

## read URLs from a data file in a loop
while read url name
do
    export DISPLAY=:11
    google-chrome --window-size=1282,2056 --window-position=0,0 --user-data-dir=stage-profile --kiosk --app=http://$url > /dev/null 2> /dev/null &

    sleep 3
    import -display :11 -window root ../../screenshots/$name

    killall chrome
    sleep 1
    
done < url_list.txt

    # export DISPLAY=:11
    # google-chrome --user-data-dir=stage-profile internet.ya.ru > /dev/null 2> /dev/null &

## clean up when done
vncserver -kill :11
