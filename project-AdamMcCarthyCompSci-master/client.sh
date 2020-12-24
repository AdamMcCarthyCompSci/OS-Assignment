#!/bin/bash
if [ $# -lt 2 ]; then
 echo "Error: parameters problem"
 exit 1
fi
clientPipe=~/assignment/$1
clientPipe+=".pipe"
if [[ ! -p $clientPipe ]]; then
 mkfifo $clientPipe
fi
serverPipe=~/assignment/server.pipe
if [[ ! -p $serverPipe ]]; then
 echo "Server not running"
 exit 1
fi
case "$2" in
  create)
   if [ $# -ne 4 ]; then
    echo "$@" > "$serverPipe"
    received=""
    while true; do
     read input < "$clientPipe"
     if [ "$received" != "$input" ]; then
      echo "$input"
      break
     fi
    done
   else
    echo "Error: Invalid parameters"
   fi
   ;;
  add)
   if [ $# -ne 5 ]; then
    echo "$@" > "$serverPipe"
    received="" 
    while true; do
     read input < "$clientPipe"
     if [ "$received" != "$input" ]; then
      echo "$input"
      break
     fi
    done
   else
    echo "Error: Invalid parameters"
   fi
   ;;
  post)
   if [ $# -ne 6 ]; then
    echo "$@" > "$serverPipe"
    received="" 
    while true; do
     read input < "$clientPipe"
     if [ "$received" != "$input" ]; then
      echo "$input"
      break
     fi
    done
   else
    echo "Error: Invalid parameters"
   fi
   ;;
  show)
    if [ $# -ne 4 ]; then
    echo "$@" > "$serverPipe"
    received="" 
    while true; do
     read input < "$clientPipe"
     if [ "$received" != "$input" ]; then
      echo "$input"
      break
     fi
    done
   else
    echo "Error: Invalid parameters"
   fi 
   ;;
  shutdown)
   if [ $# -ne 3 ]; then
    echo "$@" > "$serverPipe"
    received="" 
    while true; do
     read input < "$clientPipe"
     if [ "$received" != "$input" ]; then
      echo "$input"
      break
     fi
    done
   else
    echo "Error: Invalid parameters"
   fi 
   ;;
  *)
   echo "Error: bad request"
   exit 1
esac
