#!/bin/sh 

set -e

cat $GITHUB_EVENT_PATH

url=$(jq -r .repository.git_url "$GITHUB_EVENT_PATH")

git config --global github.user hipstersmoothie
echo Set user
git config --global github.token $GH_TOKEN
echo Set token
git config --global http.sslVerify false
echo Set ssl

git remote rm origin
git remote add origin $url
git fetch origin
# git branch --set-upstream master upstream/foo

sh -c "$*"