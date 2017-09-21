#!/bin/bash

source scripts/_include.sh

package=$1
if [ -z "$package" ]; then
    echo 'Usage: npm run get <package>'
    exit
fi

mkdir -p .gopath
task "Remote run go get -u $package"
ssh root@$remoteHost "
mkdir -p /data/go-cache/$projectName && chown www.www /data/go-cache/$projectName
docker run --rm --name $projectName -v /data/go-cache/$projectName:/go $baseTag go get -u $package
"

task "Sync data to local"
rsync -azvPq --delete --exclude='.git' --exclude='.gitignore' root@$remoteHost:/data/go-cache/$projectName/ .gopath

task "Done"
