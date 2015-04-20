# This will kill this script and all parent scripts the second time
#/etc/init.d/ambari-server stop
# We must restart the daemon
echo restarting ambari
#/usr/lib/amstore-daemon/amstore-daemon.sh stop
#/usr/lib/amstore-daemon/amstore-daemon.sh start

# Instead we stop ambari ourselves

#AMBARI_PID=$(ps -ef | grep  controller.AmbariServer | grep -v grep | awk '{print $2}')
# wait one second
sleep 1
#kill -9 $AMBARI_PID
setsid /etc/init.d/ambari-server restart
#nohup /usr/lib/amstore-daemon/amstore-daemon.sh restart &

