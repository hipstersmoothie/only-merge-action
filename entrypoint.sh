#!/bin/sh

set -e

npm i -g auto-release-cli

mkdir ~/.ssh && ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
echo "//registry.npmjs.org/:_authToken=$NPM_TOKEN" >> ~/.npmrc

sh -c "auto $*"
