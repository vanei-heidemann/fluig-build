#
# Copyright 2017, TOTVS S.A.
# All rights reserved.
#

SHELL = /bin/bash

# Rule "update-versions"
.PHONY: update-versions
update-versions:
	rm -f .env
	mvn clean -f pom.xml

# Rule "run-db"
.PHONY: run-db
run-db:
	docker-compose -f docker-db.yml up

# Rule "stop-db"
.PHONY: stop-db
stop-db:
	docker-compose -f docker-db.yml down

# Rule "run-migration"
.PHONY: run-migration
run-migration:
	docker-compose -f docker-migration.yml up

# Rule "run-app"
.PHONY: run-app
run-app:
	docker-compose -f docker-app.yml up

# Rule "stop-app"
.PHONY: stop-app
stop-app:
	docker-compose -f docker-app.yml down

# Rule "start"
.PHONY: start
start:
	make run-db & \
	sleep 20; \
	make run-migration; \
	make run-app

# Rule "stop"
.PHONY: stop
stop:
	make stop-app; \
	make stop-db

# Rule "clear-volume"
.PHONY: clear-volume
clear-volume:
	docker system prune -f && \
	    sudo rm -rf volume && \
	    mkdir volume && \
	    chmod 777 volume && \
	    sudo rm -rf data
