#!/bin/bash

LINK_FILE=url_list2.txt

if [ -s $LINK_FILE ]  
then  
   # echo "The File has some data." 

  #server with a specific DISPLAY
  vncserver :11 -geometry 1280x2556
  
  ## read URLs from a data file in a loop
  while read url name
  do
      export DISPLAY=:11
      google-chrome --disable-translate --window-size=1282,2056 \
      --window-position=0,0 --lang=ru --country=RU --user-data-dir=stage-profile \
      --kiosk --app=$url > /dev/null 2> /dev/null &  
  
      sleep 3
      import -display :11 -window root ../../screenshots/$name
  
      killall chrome
      sleep 1
      
  done < $LINK_FILE
  
  ## clean up when done
  vncserver -kill :11

else  
    echo "The File is empty."
fi
