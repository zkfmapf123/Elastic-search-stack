NETWORK_NAME := elk-network

## Create Docker Network (0)
network:
	if ! docker network inspect $(NETWORK_NAME) > /dev/null 2>&1 ; then \
		docker network create $(NETWORK_NAME); \
	fi

## Kibana (1)
kibana-start:
	docker-compose -f kibana.docker-compose.yml up --build -d

## Elastic Search + Metric Beat (2)
es-start:
	docker-compose -f elastic.docker-compose.yml up --build -d

## Elastic Search Clustering Test (3)
es-master-test:
	@curl -s -H 'Content-Type: application/json' localhost:9200/_nodes | jq > output.json

## ElasticSearch + Kibana set (0 + 1 + 2 + 3)
ek-start: 
	@make network
	@make es-start
	@make kibana-start


