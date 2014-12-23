#!/bin/bash

#ENA_F11=true
#XDO=%1

#server with a specific DISPLAY
vncserver :11 -geometry 1280x1024

export DISPLAY=:11
google-chrome --tmp-profile http://internet.ya.ru > /dev/null 2> /dev/null &
sleep 2
xdotool key F11
sleep 1
xdotool key F11
sleep 2
# killall google-chrome

## read URLs from a data file in a loop
#count=1
while read url name
do

    #export DISPLAY=:11
    #xdotool key Control+F4
    # send URL to the firefox session
#    firefox -private -new-tab --display :11 $url > /dev/null 2> /dev/null &
#    chromium-brouser -new-tab --display :11 $url > /dev/null 2> /dev/null &
   
    export DISPLAY=:11
    google-chrome --tmp-profile --kiosk http://$url > /dev/null 2> /dev/null &
    sleep 1
    #export DISPLAY=:11
    #xdotool key F11
    #sleep 2
    #XDO=$(xdotool getactivewindow)
    #print "XDO=$XDO"

    #sleep 1
    #if [ $ENA_F11 = "true" ]; then 
    	#export DISPLAY=:11
    	#wmctrl -a chrom
    	#xdotool key F11
    #    ENA_F11=false;
    #fi       
    # take a picture after waiting a bit for the load to finish
    sleep 3
    import -display :11 -window root ../../screenshots/$name

    killall google-chrome
    sleep 1
    # export DISPLAY=:11
    #WID=`xdotool search "Mozilla Firefox" | head -1`
    #xdotool windowactivate --sync $WID
    
    #xdotool windowactivate $XDO
    #wmctrl -a chrom
    #xdotool key Control+F4 
    #count=`expr $count + 1`
    
    #export DISPLAY=:11
    #google-chrome --tmp-profile --app=http://mail.ru > /dev/null 2> /dev/null &

done < url_list.txt

## clean up when done
vncserver -kill :11
