#!/bin/bash

cd modules/darknode-ui-ts
git checkout develop
git pull
npm run build
cd ../..
go run cmd/web/web.go