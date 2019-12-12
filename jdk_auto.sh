#!/bin/bash
#jdk auto install
echo "=================================="
echo "===JDK Auto_Install for Linux ===="
echo "=================================="

DIR="/usr/java"
FILE_ZIP="jdk-8u231-linux-x64.tar.gz"
UN_ZIP="jdk1.8.0_231"
URL="http://qq008.cn/download/${FILE_ZIP}"

if [ "$UID" != 0 ];then
        echo    "User must be root, Please try by root!"
        sleep 2
        exit 1
fi

if [ ! -e "$DIR" ];then
    mkdir -p $DIR
fi

cd $DIR
if [ -e $FILE_ZIP ];then
        echo "$FILE_ZIP file exist"
        tar -zxvf $FILE_ZIP
else
        wget $URL
        tar -zxvf $FILE_ZIP
fi

sleep 1

cat >> /etc/profile << EOF
#java environment
export JAVA_HOME=/usr/java/${UN_ZIP}
export PATH=$PATH:/usr/java/${UN_ZIP}/bin
export CLASSPATH=.:${JAVA_HOME}/lib/dt.jar:${JAVA_HOME}/lib/tools.jar
EOF

sleep 1
java -version
echo "================================================================="
echo -e "\033[31m 请执行 ''source /etc/source'' 刷新变量环境 \033[0m"
echo "================================================================="
