#!/bin/sh 

set -e

url=$(jq -r .repository.clone_url "$GITHUB_EVENT_PATH" |  sed "s/https:\/\///g")

git config --global github.token $GH_TOKEN
git config --global http.sslVerify false

git remote rm origin
git remote add origin https://$GH_TOKEN@$url
git fetch origin
git branch --set-upstream-to origin/master

git log -1 --pretty=%B | grep -F '[skip ci]' && exit 78

exit 0
