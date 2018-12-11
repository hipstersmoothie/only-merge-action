#!/bin/sh 

set -e

cat $GITHUB_EVENT_PATH

url=$(jq -r .repository.clone_url "$GITHUB_EVENT_PATH")

git config --global github.user hipstersmoothie
echo Set user
git config --global github.token $GH_TOKEN
echo Set token
git config --global http.sslVerify false
echo Set ssl

git fetch origin
# git branch --set-upstream master upstream/foo

sh -c "$*"