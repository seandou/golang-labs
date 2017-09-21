#!/bin/bash

source scripts/_include.sh

ssh root@$remoteHost "rm -rf /data/go-cache/$projectName"
rm -rf .gopath/*
