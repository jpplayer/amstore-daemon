FOLDER="$PWD"

function usage() {
        echo 'amstore-daemon start|stop|restart|status'
        exit 1

}

function start() {
     if [[ -f /var/run/amstore-daemon.pid ]]; then
	echo "Amstore already running, stop it first."
	exit 1
     fi

     nohup java -jar target/amstore-daemon-1.0.jar >> /var/log/amstore-daemon.log 2>&1 &
     echo "$!" > /var/run/amstore-daemon.pid
     cat  /var/run/amstore-daemon.pid
}

function stop() {
      # Graceful
      if [[ -f /var/run/amstore-daemon.pid ]]; then
      	kill $(cat /var/run/amstore-daemon.pid)
      	rm -f /var/run/amstore-daemon.pid
      else # Not so graceful
	APID=$(ps -ef | grep -v grep | grep amstore-daemon | awk '{print $2}')
	kill -KILL $APID
      fi
}


function status() {
	if [[ -f /var/run/amstore-daemon.pid ]]; then
		ps -ef | grep -v grep | grep $(cat /var/run/amstore-daemon.pid) > /dev/null 2>&1
		if [[ $? == 0 ]]; then
			echo 'Amstore is started'
			exit 0
		else
			rm -f /var/run/amstore-daemon.pid
		fi
	fi
	echo 'Amstore is stopped.'
	exit 0
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
        	status
	;;
        *)
                usage
        ;;
esac
