FOLDER="$PWD"

function usage() {
        echo 'amstore-daemon start|stop|restart|status'
        exit 1

}

function start() {
     nohup java -jar target/amstore-daemon-1.0.jar >> /var/log/amstore-daemon.log 2>&1 &
     echo "$!" > /var/run/amstore-daemon.pid
     cat  /var/run/amstore-daemon.pid
}

function stop() {
      kill -- -$(cat /var/run/amstore-daemon.pid)
      rm -f /var/run/amstore-daemon.pid
}

case "$1" in
        start)
                start
        ;;
        stop)
                stop
        ;;
        restart)
                stop
                start
        ;;
        status)
                ps -ef | grep $(cat /var/run/amstore.pid) || echo 'Amstore is stopped.'
        ;;
        *)
                usage
        ;;
esac
