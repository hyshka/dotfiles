#!/bin/sh
#
export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/nvm.sh
source /usr/share/nvm/install-nvm-exec

nvm install 0.10
npm install -g bower gulp grunt-cli node-sass eslint eslint-config-airbnb sass-lint
npm config set python python2.7
nvm install 4
npm install -g bower gulp grunt-cli node-sass eslint eslint-config-airbnb sass-lint
npm config set python python2.7
nvm install 6
npm install -g bower gulp grunt-cli node-sass eslint eslint-config-airbnb sass-lint
npm config set python python2.7
nvm alias default 6
