#
# Copyright 2017, TOTVS S.A.
# All rights reserved.
#

SHELL = /bin/bash

# Rule "run-db"
.PHONY: run-db
run-db:
	docker-compose -f docker-db.yml up

# Rule "stop-db"
.PHONY: stop-db
stop-db:
	docker-compose -f docker-db.yml down

# Rule "run-app"
.PHONY: run-app
run-app:
	docker-compose -f docker-app.yml up

# Rule "stop-app"
.PHONY: stop-app
stop-app:
	docker-compose -f docker-app.yml down

# Rule "clear-volume"
.PHONY: clear-volume
clear-volume:
	docker system prune -f && \
	    sudo rm -rf volume && \
	    mkdir volume && \
	    chmod 777 volume && \
	    sudo rm -rf mysql
