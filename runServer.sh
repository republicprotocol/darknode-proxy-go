#!/bin/bash

cd darknode-ui-ts
git checkout master
git pull
npm run build
cd ..
go run cmd/proxy/main.go