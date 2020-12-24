#!/bin/bash
if [ $# -ne 3 ]; then
 echo "Error: parameters problem"
 exit 1
fi

if [ ! -d ~/assignment/"$1" ]; then
  echo "Error: Receiver does not exist"
 exit 2
fi

if [ ! -d ~/assignment/"$2" ]; then
 echo "Error: Sender does not exist"
 exit 2
fi

friendFile=~/assignment/"$1"/friends.sh
wallFile=~/assignment/"$1"/wall.sh

if grep -Fxq "$2" "$friendFile" 
then
 echo "$2: $3" >> "$wallFile" 
 echo "OK: Message posted to wall"
 exit 0
else
 echo "Error: Sender is not a friend of receiver"
 exit 3
fi
