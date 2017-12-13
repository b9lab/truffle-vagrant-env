#!/usr/bin/env bash

set vx
apt-get install -y software-properties-common
add-apt-repository -y ppa:ethereum/ethereum
add-apt-repository -y ppa:ethereum/ethereum-dev
add-apt-repository -y ppa:ethereum/ethereum-qt
# curl -sL https://deb.nodesource.com/setup_iojs_2.x | sudo -E bash -
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

apt-get update
# apt-get upgrade -y

apt-get install -y git python dstat ntp nodejs build-essential \
	solc ethereum 

service ntp reload

# For custom build config
npm install -g node-gyp truffle@3.4.11 \
	truffle-default-builder ether-pudding rimraf web3@0.20.2 \
	ethereumjs-testrpc@6.0.3 q

# To get a local Web server from your build folder: 
# php -S 0.0.0.0:8000
apt-get install -y php5-cli
# or python -m SimpleHTTPServer 8000
apt-get install -y python-pip python-dev libssl-dev