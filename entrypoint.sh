#!/bin/sh 

set -e

url=$(jq -r .repository.clone_url "$GITHUB_EVENT_PATH")
git remote add origin $url
git fetch origin

sh -c "$*"