#!/usr/bin/env bash

set vx
apt-get install software-properties-common
add-apt-repository -y ppa:ethereum/ethereum
add-apt-repository -y ppa:ethereum/ethereum-dev
add-apt-repository -y ppa:ethereum/ethereum-qt
curl -sL https://deb.nodesource.com/setup_iojs_2.x | sudo -E bash -
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -

apt-get update
apt-get upgrade

apt-get install -y git python solc ethereum cpp-ethereum nodejs ntp build-essential

git clone https://github.com/ConsenSys/truffle.git
cd truffle
sudo npm -g install

service ntp reload

# For custom build config
npm install -g "truffle-default-builder" "ether-pudding" "rimraf" "web3" "ethereumjs-testrpc"

# To get a local Web server from your build folder: 
# php -S 0.0.0.0:8000
apt-get install -y php5-cli