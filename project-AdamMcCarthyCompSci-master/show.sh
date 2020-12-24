#!/bin/bash
if [ $# -ne 1 ]; then
 echo "Error: parameters problem"
 exit 1
fi

if [ ! -d ~/assignment/"$1" ]; then
  echo "Error: user does not exist"
 exit 2
fi

wallFile=~/assignment/"$1"/wall.sh

echo "wallStart"
while IFS= read -r line
do
 echo "$line"
done < $wallFile
echo "wallEnd"
exit 1
