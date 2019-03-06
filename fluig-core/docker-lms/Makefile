#
# Copyright 2017, TOTVS S.A.
# All rights reserved.
#

SHELL = /bin/bash

# Rule "run-db"
.PHONY: run-db
run-db:
	docker-compose -f docker-db.yml up

# Rule "run-migration"
.PHONY: run-migration
run-migration:
	docker-compose -f docker-migration.yml up

# Rule "run-app"
.PHONY: run-app
run-app:
	docker-compose -f docker-app.yml up

# Rule "clear-volume"
.PHONY: clear-volume
clear-volume:
	docker system prune --volumes -f && sudo rm -rf volume && mkdir volume && chmod 777 volume
