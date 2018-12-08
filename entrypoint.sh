#!/bin/sh

set -e

npm i -g auto-release-cli
ls
sh -c "auto $*"
