#!/bin/sh 

set -e

cat $GITHUB_EVENT_PATH

url=$(jq -r .repository.clone_url "$GITHUB_EVENT_PATH")
git config --global http.sslVerify false
git fetch origin
# git branch --set-upstream master upstream/foo

sh -c "$*"