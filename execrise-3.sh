#!/bin/bash

read -p "Enter system username: " user

read -p "How do you want to sort the processes memory(m) or CPU(c) (m/c) : " sortBy

echo "Print the processes running $user"

os="`uname`"

if [ "$sortBy" == "m" ]
  then
  echo "===============Memory=============="
  case $os in 
    'Linux')
      ps aux --sort -rss | grep $user 
      ;;
    'Darwin')
      ps aux | sort -rss | grep $user
      ;;
    *) echo "unknown: $os" ;;
  esac
elif [ "$sortBy" == "c" ]
  then
  echo "===============CPU=============="
  case $os in
    'Linux')
      ps aux --sort -%cpu | grep $user
      ;;
    'Darwin')
      ps -eo pcpu,pid,user,args | sort -k 1 -r | grep $user 
      ;;
    *) echo "unknown: $os" ;;
  esac
else
  echo "Wrong sorting input, read the instrution then try again."
fi
