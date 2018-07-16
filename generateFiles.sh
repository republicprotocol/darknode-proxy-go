#!/bin/bash

# Build UI
cd modules/darknode-ui-ts
git checkout develop
git pull
npm run build
cd ../..

# Build CLI
cd modules/darknode-cli
git checkout master
git pull
bash generate.sh
mv -v build/* ../../public
cd ../..