#!/bin/bash
# Install awslogs and the jq JSON parser
#
# cloud-config
yum install epel-release -y
yum install jq -y
jq --version
echo ${app}

cat <<EOF >/root/awslogs.conf
[general]
state_file = /var/awslogs/state/agent-state

[/var/log/messages]
file = /var/log/messages
log_group_name = ${app}/messages
log_stream_name = {ip_address}
datetime_format = %b %d %H:%M:%S
initial_position = start_of_file
buffer_duration = 5000
EOF

curl https://s3.amazonaws.com/aws-cloudwatch/downloads/latest/awslogs-agent-setup.py -O
python ./awslogs-agent-setup.py --non-interactive --region us-east-1 --configfile=/root/awslogs.conf
systemctl start awslogs
chkconfig awslogs on

exit 0