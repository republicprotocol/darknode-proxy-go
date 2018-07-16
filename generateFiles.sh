#!/bin/bash

UI_FOLDER="ui"

# Add modules
rm -rf modules
git clone https://github.com/republicprotocol/darknode-ui-ts.git modules/darknode-ui-ts
git clone https://github.com/republicprotocol/darknode-cli.git modules/darknode-cli

# Remove the old UI build folder
rm -rf "./public/${UI_FOLDER}"

# Build UI
cd ./modules/darknode-ui-ts
npm install
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