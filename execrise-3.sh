#!/bin/bash

read -p "Enter system username: " user

echo "Print the processes running $user"

ps aux | grep $user