#!/bin/bash

read -p "Enter system username: " user

read -p "How do you want to sort the processes memory(m) or CPU(c) (m/c) : " sortBy

read -p "Enter number of lines you want to log/show: " lines

echo "Print the processes running $user"

os="`uname`"

if [ $sortBy == "m" ] || [ $sortBy == "M" ];
  then
  echo "===============Memory=============="
  case $os in 
    'Linux')
      ps aux --sort -rss | grep $user | head -n $lines
      ;;
    'Darwin')
      ps aux | sort -rss | grep $user | head -n $lines
      ;;
    *) echo "unknown: $os" ;;
  esac
elif [ $sortBy == "c" ] || [ $sortBy == "C" ];
  then
  echo "===============CPU=============="
  case $os in
    'Linux')
      ps aux --sort -%cpu | grep $user | head -n $lines
      ;;
    'Darwin')
      ps -eo pcpu,pid,user,args | sort -k 1 -r | grep $user | head -n $lines
      ;;
    *) echo "unknown: $os" ;;
  esac
else
  echo "Wrong sorting input, read the instrution then try again."
fi
