#!/bin/bash
#jdk auto install
echo "=================================="
echo "===JDK Auto_Install for CentOS===="
echo "=================================="

DIR="/usr/java"
URL="http://qq008.cn/jdk-1.8.0_231.tar.gz"
FILE="jdk-1.8.0_231.tar.gz"

if [ "$UID" != 0 ];then
        echo    "User must be root, Please try by root!"
        sleep 2
        exit 1
fi

if [ ! -e "$DIR" ];then
    mkdir -p $DIR
fi

cd $DIR

if [ -e $FILE ];then
        echo "$FILE file exist"
        tar -zxvf $FILE
else
        wget $URL
        tar -zxvf $FILE
fi

sleep 1

cat >> /etc/profile << EOF
#java environment
export JAVA_HOME=/usr/java/jdk1.8.0_231
export PATH=$PATH:/usr/java/jdk1.8.0_231/bin
export CLASSPATH=.:${JAVA_HOME}/lib/dt.jar:${JAVA_HOME}/lib/tools.jar
EOF

sleep 1
java -version
echo "================================================================="
echo -e "\033[31m 请执行 ''source /etc/source'' 刷新变量环境 \033[0m"
echo "================================================================="
