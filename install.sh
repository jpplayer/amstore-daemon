FOLDER=/usr/lib/amstore-daemon

function uninstall() {
rm -rf $FOLDER
}

function install() {
mkdir -p $FOLDER
cp target/amstore-daemon-1.0.jar $FOLDER
cp -rf target/lib/* $FOLDER
cp ambari-restarter.sh $FOLDER
cp amstore-daemon.sh $FOLDER
chmod +x $FOLDER/amstore-daemon.sh
}

uninstall
install
