#!/bin/sh

DESC="Dashing"
DASHING_DIR="/var/www/dashing"
INSTANCE_DIR="$DASHING_DIR/wunderstatus"
PIDFILE="$INSTANCE_DIR/tmp/pids/unicorn.pid"
DAEMON="unicorn"
DAEMONOPTS=" -c ./unicorn.rb -p 3030 -D"
STOPOPTS="stop"
#GEM_HOME=/usr/local/rvm/gems/ruby-2.1.2

#store dashing pid in $PID, else empty string
if [ -f $PIDFILE ]; then
  PID=$(<"$PIDFILE")
#else
#  echo ""
fi

case "$1" in
start)
    printf "%-50s" "Starting $DESC..."
    cd $INSTANCE_DIR ; $DAEMON $DAEMONOPTS
    if [ -f $PIDFILE ]; then
        printf "%s\n" "Ok"
    else
        printf "%s\n" "Fail"
    fi
    ;;
stop)
    echo "Killing $DESC..."
    if [ -f $PIDFILE ]; then
#      cd $INSTANCE_DIR ; $DAEMON $STOPOPTS
#      sleep 1s && echo "RIP $DESC"
       cat $PIDFILE | xargs kill -QUIT && sleep 3s && echo "RIP $DESC"
    else
      printf "Stop beating the dead horse (it's already dead!)\n"
    fi
    ;;
restart)
    $0 stop
    $0 start
    ;;
logs)
    echo "See the logs of the Dashing."
    tail -f `$INSTANCE_DIR/log/unicorn.log`
    ;;
status)
    # Check to see if the process is running
    ps aux | grep -i dashing
    ;;
  esac
  exit