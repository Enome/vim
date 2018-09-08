#!/bin/bash
ARG=$1
SLASH="/"
DASH="-"
DIR="${ARG/$SLASH/$DASH}"

git submodule add https://github.com/$ARG pack/others/start/$DIR
git add .gitmodules pack/others/start/$DIR
