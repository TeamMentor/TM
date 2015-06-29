#!/bin/bash

. ./bin/import-shared

log_usage () {
	echo "Usage: $SCRIPTNAME {start|stop}" >&2
	echo "We will start or stop all the configured TM Windows Services for you"
	exit 3
}

do_start_stop() {
  for i in $SERVICES
  do 
     ./bin/winSrvc.sh $1 $i  
  done
}

case "$1" in
  stop)
  do_start_stop $1
  ;;
  start)
  do_start_stop $1
   ;;
  *)
	log_usage
	;;
esac

: