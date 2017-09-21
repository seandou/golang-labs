#!/bin/bash

if [ -z "$REMOTE_HOST" ]; then
    echo 'REMOTE_HOST env is empty.'
    exit
fi

remoteHost=$REMOTE_HOST

projectName='golang-labs'
baseTag='seandou/alpine-go:v1.9'

function task() {
    local now=$(date +%Y/%m/%d\ %H:%M:%S)
    echo "==> [$now] $1"
}
