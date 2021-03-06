#!/bin/sh

function help(){
        echo "-----------------"
        echo "HELP: $0 LogFile"
        echo "-----------------"
        exit 1
}

if [ $# -ne 1 ]
then
        help
fi

LogFile=$1
if [ ! -f $LogFile ]
then
        echo "ERROR: $LogFile not found"
        exit 1
fi
zkDir=/home/xiaoju/tools/zk-server-2181
JAVA_OPTS="$JAVA_OPTS -Djava.ext.dirs=$zkDir:$zkDir/lib"
java $JAVA_OPTS org.apache.zookeeper.server.LogFormatter "$LogFile"
