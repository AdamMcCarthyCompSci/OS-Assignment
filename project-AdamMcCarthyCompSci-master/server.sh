#! /bin/bash
mkfifo server.pipe
while true; do
 received=""
 read input < server.pipe
 if [ "$received" != "$input" ]; then
  read -a arr <<< $input
  clientID="${arr[0]}"
  clientID+=.pipe
  received="$input"
 fi
 ./P.sh "${arr[2]}"
 case "${arr[1]}" in
  create)
   ./create.sh "${arr[@]:2}"
   echo "Create executed." > "$clientID"
  ./V.sh "${arr[2]}"
   ;;
  add)
   ./add.sh "${arr[@]:2}"
   echo "Add executed." > "$clientID"
   ./V.sh "${arr[2]}"
   ;;
  post)
   ./post.sh "${arr[@]:2}"
   echo "Post executed." > "$clientID"
   ./V.sh "${arr[2]}"
   ;;
  show)
   ./show.sh "${arr[@]:2}"
   echo "Show executed." > "$clientID"
   ./V.sh "${arr[2]}"
   ;;
  shutdown)
   echo "Shutdown executed." > "$clientID"
   rm -r server.pipe
   rm -r "$clientID"
   ./V.sh "${arr[2]}"
   kill -9 $$
   ;;
  *)
   echo "Error: bad request" > "$clientID"
   echo "Error: bad request"
   rm -r "$clientID"
   ./V.sh "${arr[2]}"
   exit 1
  esac
 rm -r "$clientID"
done
rm -r "$clientID"
rm -r server.pipe
