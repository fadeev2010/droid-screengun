#!/bin/bash

ENA_F11=true

#server with a specific DISPLAY
vncserver :11 -geometry 1024x768

## read URLs from a data file in a loop
count=1
while read url name
do
    #
    #firefox -new-tab --display :11 about:blank > /dev/null 2> /dev/null &

    # send URL to the firefox session
    firefox -private -new-tab --display :11 $url > /dev/null 2> /dev/null &
    #sleep 2
    #if [ $F11 = "true" ]; then 
    	export DISPLAY=:11
    	xdotool key F11
     #   F11=false
    #fi       
    # take a picture after waiting a bit for the load to finish
    sleep 5
    import -display :11 -window root ../../screenshots/$name.jpg

    export DISPLAY=:11
    xdotool key ctrl+W
    
    count=`expr $count + 1`
done < url_list.txt

## clean up when done
vncserver -kill :11
