#!/bin/bash
##echo "Displaying App Name:" ${appname2}
##export APP_NAME=${appname2}
##export ENV=${env2}
##echo "Displaying Appdevice Name:" ${DEVICE}
##echo "Displaying mount Name:" ${MOUNT_POINT}

##export DEVICE=${DEVICE}
##export MOUNT_POINT=${MOUNT_POINT}

####################################################

sudo yum install java-1.8.0-openjdk-devel -y
sudo yum install epel-release -y
sudo yum install centos-release-scl -y
sudo yum install rh-python36 -y
scl enable rh-python36 bash
python --version
sudo yum install python3-pip -y
pip3 --version
sudo yum install python3-devel -y
sudo yum groupinstall 'development tools' -y

cat <<EOF >/etc/yum.repos.d/cassandra.repo
[cassandra]
name=Apache Cassandra
baseurl=https://downloads.apache.org/cassandra/redhat/40x/
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://downloads.apache.org/cassandra/KEYS
EOF

sudo yum install cassandra -y
sudo systemctl enable cassandra
sudo systemctl start cassandra