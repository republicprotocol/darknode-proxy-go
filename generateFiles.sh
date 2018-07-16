#!/bin/bash

UI_FOLDER="ui"

# Remove the old UI build folder
rm -rf "./public/${UI_FOLDER}"

# Build UI
cd ./modules/darknode-ui-ts
git checkout develop
git pull
PUBLIC_URL="/${UI_FOLDER}" npm run build
mv build "../../public/${UI_FOLDER}"
cd ../..

# Build CLI
cd modules/darknode-cli
git checkout master
git pull
bash generate.sh
mv -v build/* ../../public
cd ../..