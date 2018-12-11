#!/bin/sh 

set -e

url=$(jq -r .repository.clone_url "$GITHUB_EVENT_PATH")
git fetch origin
# git branch --set-upstream master upstream/foo

sh -c "$*"