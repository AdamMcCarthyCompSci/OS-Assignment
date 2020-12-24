#!/bin/bash
if [ $# -ne 2 ]; then
 echo "Error: parameters problem"
 exit 1
fi

if [ ! -d ~/assignment/"$1" ]; then
  echo "Error: user does not exist"
 exit 2
fi

if [ ! -d ~/assignment/"$2" ]; then
 echo "Error: friend does not exist"
 exit 2
fi

 friendFile=~/assignment/"$1"/friends.sh

if grep -Fxq "$2" "$friendFile" 
then
 echo "Error: user already friends with this user"
 exit 3
else
 echo "$2" > "$friendFile"
 echo "OK: friend added"
 exit 0
fi
