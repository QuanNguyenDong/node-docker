DC = docker-compose
DK = docker
DCYML = docker-compose.yml
DCDYML = docker-compose.dev.yml

docker-compose-up: docker-compose.yml
	$(DC) -f $(DCYML) -f $(DCDYML) up -d

docker-compose-up-scale2: docker-compose.yml
	$(DC) -f $(DCYML) -f $(DCDYML) up -d --scale node-app=2

docker-compose-down: docker-compose.yml
	$(DC) -f $(DCYML) -f $(DCDYML) down

exec-mongodb:
	$(DK) exec -it node-docker_mongo_1 mongosh -u "sanjeev" -p "mypassword"

exec-redis:
	$(DK) exec -it node-docker_redis_1 bash