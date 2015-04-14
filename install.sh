FOLDER=/usr/local/amstore-daemon

function uninstall() {
rm -rf $FOLDER
rm -f /usr/local/bin/amstore-daemon.sh
}


function install() {
mkdir -p $FOLDER
cp -f target/amstore-daemon-1.0.jar $FOLDER
cp -rf target/lib/* $FOLDER
cp ambari-restarter.sh $FOLDER
cp -f amstore-daemon.sh /usr/local/bin
chmod +x /usr/local/bin/amstore-daemon.sh
}


uninstall
install
