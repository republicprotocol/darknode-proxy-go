#!/bin/bash

MODULES_FOLDER="modules"
UI_FOLDER="ui"

# Add modules
if [ -d "$MODULES_FOLDER" ]; then
    cd "$MODULES_FOLDER/darknode-ui-ts"
    git pull
    cd ../darknode-cli
    git pull
    cd ../..
else
    git clone https://github.com/republicprotocol/darknode-ui-ts.git "$MODULES_FOLDER/darknode-ui-ts"
    git clone https://github.com/republicprotocol/darknode-cli.git "$MODULES_FOLDER/darknode-cli"
fi

# Remove the old UI build folder
rm -rf "public/$UI_FOLDER"

# Build UI
cd "$MODULES_FOLDER/darknode-ui-ts"
npm install
PUBLIC_URL="/$UI_FOLDER" npm run build
mv build "../../public/$UI_FOLDER"
cd ../..

# Build CLI
# cd "$MODULES_FOLDER/darknode-cli"
# bash generate.sh
# mv -v build/* ../../public
# cd ../..