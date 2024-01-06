NETWORK_NAME := elk-network

## Create Docker Network (0)
network:
	if ! docker network inspect $(NETWORK_NAME) > /dev/null 2>&1 ; then \
		docker network create $(NETWORK_NAME); \
	fi

## Elastic Search Clustering Test (3)
es-master-test:
	@curl -s -H 'Content-Type: application/json' localhost:9200/_nodes | jq > output.json

## ElasticSearch + Kibana set (0 + 1 + 2 + 3)
ek-start: 
	@make network
	@docker-compose -f elastic.docker-compose.yml up --build -d
	@docker-compose -f kibana.docker-compose.yml up --build -d
	@docker-compose -f nginx.docker-compose.yml up --build -d
	@docker-compose -f logstash.docker-compose.yml up --build -d

ek-down:
	@docker-compose -f elastic.docker-compose.yml down
	@docker-compose -f kibana.docker-compose.yml down
	@docker-compose -f nginx.docker-compose.yml down
	@docker-compose -f logstash.docker-compose.yml down

## Webserver-test
web-test:
	@for i in $$(seq 1 10); do \
        curl -X GET http://localhost:8080; \
    done