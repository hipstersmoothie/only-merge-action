#!/bin/sh 

set -e

cat $GITHUB_EVENT_PATH

url=$(jq -r .repository.clone_url "$GITHUB_EVENT_PATH")

git config --global user.name "Andrew Lisowski"
git config --global user.email lisowski54@gmail.com 
git config --global github.token $GITHUB_TOKEN
git config --global http.sslVerify false

git fetch origin
# git branch --set-upstream master upstream/foo

sh -c "$*"