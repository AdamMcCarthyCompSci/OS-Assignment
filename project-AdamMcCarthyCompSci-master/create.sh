#!/bin/bash
if [ $# -ne 1 ]; then
 echo "Error: parameters problem"
 exit 1
fi

if [ ! -d ~/assignment/"$1" ]; then
 mkdir  ~/assignment/"$1";
 touch  ~/assignment/"$1"/friends.sh
 chmod u+x ~/assignment/"$1"/friends.sh
 touch  ~/assignment/"$1"/wall.sh
 chmod u+x ~/assignment/"$1"/wall.sh
else
 echo "Error: user already exists"
 exit 2
fi

echo "OK: user created"
exit 0
