#!/bin/bash

#server with a specific DISPLAY
vncserver :11 -geometry 1280x2556

## read URLs from a data file in a loop
while read url name
do
    export DISPLAY=:11
    google-chrome --window-size=1282,2056 --window-position=0,0 --user-data-dir=stage-profile --kiosk --app=$url > /dev/null 2> /dev/null &

    sleep 3
    import -display :11 -window root ../../screenshots/$name

    killall chrome
    sleep 1
    
done < url_list.txt

## clean up when done
vncserver -kill :11
