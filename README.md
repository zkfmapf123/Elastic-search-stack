# ELK Stack

![elk](./public/elk.png)

## Execute 

```sh
    cd cloud
    terraform init && terraform apply
    make scp-up
```

## Todo (Local)

- [x] Elastic Search
  - Master (9200)
  - Slaves (1,2) -> 9300
- [x] MetricBeat
  - Kibana를 통해서 ES (Master, Slave) System Monitoring
- [x] Kibana
- [x] Filebeat
- [x] LogStash
  - input -> filter -> output pipeline
  - jRuby

        ```
            input {
                ...
            }
            
            filter {
                ...
            }

            output {
                ...
            }
        ```

## Todo (Cloud)

- EC2 ELK Pipeline
- ECS ELK Pipeline

## Beat Products

- AuditBeat (Linux의 Audit Message)
- <b>FileBeat (파일의 있는 정보) </b>
- <b>MetricBeat (System Metric 정보) </b>
- PacketBeat (네트워크 패킷의 정보)
- <b>HeardBeat</b> (BlackBox -> TCP, HTTP Level의 살아있는지, Uptime)
- WinlogBeat (윈도우 로그)
- <b>FunctionBeat</b> (Serverless 형태로 데이터 Shipping)



## Reference

- <a href="https://www.elastic.co/guide/en/logstash/current/input-plugins.html#input-plugins"> Logstash Input Plugins </a>
- <a href="https://docs.aws.amazon.com/ko_kr/cli/latest/userguide/cli-services-ec2-instances.html#listing-instances"> AWS CLI for EC2 Instance </a>

## 회고...

[REMINDER](./REMINDER.md)