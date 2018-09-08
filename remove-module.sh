#!/bin/bash
DIR=$1

git submodule deinit pack/others/start/$DIR
git rm pack/others/start/$DIR
rm -Rf .git/modules/pack/shapeshed/start/$DIR
