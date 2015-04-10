# This will kill this script and all parent scripts.
#/etc/init.d/ambari-server stop
# Instead we stop ambari ourselves

AMBARI_PID=$(ps -ef | grep  controller.AmbariServer | grep -v grep | awk '{print $2}')
# wait one second
sleep 1
kill -9 $AMBARI_PID
nohup /etc/init.d/ambari-server start &

