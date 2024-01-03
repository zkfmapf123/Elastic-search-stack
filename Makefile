## Elastic Search + Metric Beat 
es-start:
	docker-compose -f elastic.docker-compose.yml up --build -d

es-master-test:
	@curl -s -H 'Content-Type: application/json' localhost:9200/_nodes | jq > output.json

es-run: es-start	
	@make es-master-test