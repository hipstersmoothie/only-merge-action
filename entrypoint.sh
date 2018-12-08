#!/bin/sh

set -e

npm i -g auto-release-cli
sh -c "auto $*"
