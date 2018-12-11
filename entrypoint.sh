#!/bin/sh 

set -e

cat $GITHUB_EVENT_PATH

url=$(jq -r .repository.git_url "$GITHUB_EVENT_PATH" |  sed "s/https:\/\///g")

git config --global github.user hipstersmoothie
echo Set user
git config --global github.token $GH_TOKEN
echo Set token
git config --global http.sslVerify false
echo Set ssl

echo $url

git remote rm origin
git remote add origin https://hipstersmoothie:$GH_TOKEN@$url
git fetch origin
# git branch --set-upstream master origin/master

sh -c "$*"