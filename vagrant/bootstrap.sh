#!/usr/bin/env bash

#*************************************************
# Change this to any version Node.js that you need
#*************************************************
NODE_VERSION=0.10.28

set -e # Exit script immediately on first error.
set -x # Print commands and their arguments as they are executed.

sudo apt-get -qy update
sudo apt-get -qy install vim git curl unzip gdal-bin

which node npm >/dev/null && 
{ echo "Tools already installed"; exit 0; }

# Build Latest Node.js
sudo apt-get install -qy build-essential

if [ ! -f node-v$NODE_VERSION.tar.gz ]; then
wget http://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION.tar.gz
fi

tar zxvf node-v$NODE_VERSION.tar.gz -C .
cd node-v$NODE_VERSION
./configure --prefix=/usr
make && sudo make install

rm -rf node-v$NODE_VERSION.tar.gz
rm -rf node-v$NODE_VERSION

# install npm packages
sudo npm install -g topojson