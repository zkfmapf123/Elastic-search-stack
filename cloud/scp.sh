#!/bin/bash

tag_list="es-instance logstash-instance webserver-instance kibana-instance"

for tag in $tag_list
do     
    ip=$(aws ec2 describe-instances \
    --filters "Name=tag:Name,Values=$tag" \
    --query 'Reservations[*].Instances[*].PublicIpAddress[]' \
    --output text \
    --region="ap-northeast-2")

    echo "Name : $tag ip : $ip"

    scp -i ~/.ssh/id_rsa ../*.*.yml ../config/* ../pipelines/* ec2-user@$ip:~/
done