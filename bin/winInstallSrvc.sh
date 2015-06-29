#!/bin/bash

. ./bin/import-shared

inst_id=$(tm_inst_id)

randpw=`cat /dev/urandom | tr -cd '[:alnum:]' | head -c64`

cmd "/c net user $inst_id $randpw /add"
WMIC USERACCOUNT WHERE "Name='$inst_id'" SET PasswordExpires=FALSE
cmd "/c icacls . /grant $inst_id:(OI)(CI)F"
./bin/ntrights +r SeServiceLogonRight -u $inst_id

for i in $SERVICES
do
   ./bin/winSrvc.sh install $i $inst_id $randpw
done

