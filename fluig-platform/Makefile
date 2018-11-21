#
# Copyright 2018, TOTVS S.A.
# All rights reserved.
#

SHELL = /bin/bash

# Rule "maven-fluig"
.PHONY: maven-fluig
maven-fluig:
	cd fluig && mvn -DskipTests=true clean install && $(MAKE) artifacts:generate && cd ..

# Rule "maven-lms"
.PHONY: maven-lms
maven-lms:
	cd lms && mvn -DskipTests=true -Ddocker.skip.build clean install && $(MAKE) artifacts:generate && mvn docker:build && cd ..

# Rule "maven"
.PHONY: maven
maven: maven-fluig maven-lms

# Rule "docker-fluig"
.PHONY: docker-fluig
docker-fluig:
	cd fluig/docker && $(MAKE) build:local && cd ../..

# Rule "docker-lms"
.PHONY: docker-lms
docker-lms:
	cd lms/docker && $(MAKE) build:local && cd ../..

# Rule "docker"
.PHONY: docker
docker: docker-fluig docker-lms

# Rule "fluig"
.PHONY: fluig
fluig: maven-fluig docker-fluig

# Rule "lms"
.PHONY: lms
lms: maven-lms docker-lms

# Rule "run-db"
.PHONY: run-db
run-db:
	cd docker && docker-compose -f docker-db.yml up

# Rule "stop-db"
.PHONY: stop-db
stop-db:
	cd docker && docker-compose -f docker-db.yml down

# Rule "run-migration"
.PHONY: run-migration
run-migration:
	cd docker && docker-compose -f docker-migration.yml up

# Rule "run-app"
.PHONY: run-app
run-app:
	cd docker && docker-compose -f docker-app.yml up

# Rule "stop-app"
.PHONY: stop-app
stop-app:
	cd docker && docker-compose -f docker-app.yml down

# Rule "clear-volume"
.PHONY: clear-volume
clear-volume:
	cd docker && docker system prune --volumes -f && sudo rm -rf volume && mkdir volume && chmod 777 volume

# Rule "gitclone"
.PHONY: gitclone
gitclone:
	git clone ssh://git@git.fluig.com:7999/fp/fluig.git ; \
	git clone ssh://git@git.fluig.com:7999/lms/lms.git
