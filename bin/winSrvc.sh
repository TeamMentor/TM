#!/bin/bash

. ./bin/import-shared

log_usage () {
	echo "Usage: $SCRIPTNAME {start|stop|status|install|uninstall} <SubmoduleName> [username] [password]" >&2
	echo "Provide username and password for the \"install\" option, to specify the user the service will run as" >&2
	exit 3
}

[ -n "$2" ] || log_usage
[ -f "code/$2/node_modules/winser/bin/winser" ] || log_exit "Module $2 doesnt exist or not installable as service"
startDir=`pwd`
srvcName="$2-"$(tm_inst_id)

echo $srvcName

case "$1" in
  install)
    [ -n "$3 ] || log_usage
    [ -n "$4 ] || log_usage
    cd code/$2
    node ./node_modules/winser/bin/winser -i -n $srvcName --startcmd "node app.js" 
    cd $startdir
    sc config $srvcName obj= .\\$3 password= $4
    ;;
  stop)
    sc stop $srvcName
    ;;
  start)
    sc start $srvcName
    sleep 3
    sc query $srvcName
    ;;
  uninstall)
    sc stop $srvcName
    sleep 3
    cd code/$2
    node ./node_modules/winser/bin/winser -r -n $srvcName 
    cd $startdir
    ;;
  status)
    sc query $srvcName 
    ;;
  *)
    log_usage
    ;;
esac

: