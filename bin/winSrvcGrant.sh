#!/bin/bash

. ./bin/import-shared

log_usage () {
	echo "Usage: $SCRIPTNAME IIS AppPool User (Just the user)" >&2
	echo "Ex. ./bin/winSrvcGrant TMDEVR01-beta36"
	exit 3
}

[ -n "$1" ] || log_usage

inst_id=$(tm_inst_id)


for i in $SERVICES
do
	cd ./bin
	cmd "/c subinacl.exe /service $i-$inst_id /grant="IIS AppPool"\\$1=STO"
	cd ../
done