#!/bin/bash

UI_FOLDER="ui"

# clean up the old UI build
rm -rf "./public/${UI_FOLDER}"

# update the UI build
cd ./modules/darknode-ui-ts
git checkout develop
git pull
PUBLIC_URL="/${UI_FOLDER}" npm run build
mv build "../../public/${UI_FOLDER}"
cd ../..

# run the server
go run cmd/web/web.go
