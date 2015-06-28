#!/bin/bash

. ./bin/import-shared

do_update () {
    echo "$@ Changed..updating.."
    for i in $SERVICES
    do
    ./bin/winSrvc.sh stop $i
    done
    git pull
    ./bin/npm_install.sh
    for i in $SERVICES
    do
    ./bin/winSrvc.sh start $i
    done
    log_exit "Done"
}

git fetch origin

myhead=`git rev-parse @`
uhead=`git rev-parse @{u}`

[ "$myhead" = "$uhead" ] || do_update "Heads"

git submodule | cut -c 1 | grep "+" > /dev/null
[ $? -eq 0 ] && do_update "Submodules"

log_exit "No update needed"