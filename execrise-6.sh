#!/bin/bash

apt update
apt install -y wget 

wget_version=$(wget --version 2>&1 > /dev/null | grep "GNU Wget")

if [ "$wget_version" == "" ]
then
  brew install wget 
  echo "use homebrew manager to install wget"
  export PATH="$PATH:/usr/local/bin/wget"
  # relaod the file 
  source /etc/zshrc
  echo "wget version $(wget --version) installed"
else
  echo "wget is installed"
fi

# read user input for log directory
echo -n "Set log directory location for the application (absolute path): "
read LOG_DIRECTORY
if [ -d $LOG_DIRECTORY ]
then
  echo "$LOG_DIRECTORY already exists"
else
  mkdir -p $LOG_DIRECTORY
  echo "A new directory $LOG_DIRECTORY has been created"
fi


apt install -y nodejs

node_version=$(node --version)
echo "Nodejs version $node_version was installed"

npm_version=$(npm --version)
echo "NPM version $npm_version was installed"

curl net-tools 

wget https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz

tar xvf bootcamp-node-envvars-project-1.0.0.tgz 

cd package

export APP_ENV=dev
export DB_USER=myuser
export DB_PWD=mysecret

npm install && node server.js

netstat -ltnp | grep :3000