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

# Rule "maven-boards"
.PHONY: maven-boards
maven-boards:
	cd boards && $(MAKE) maven:build && cd ..

# Rule "maven"
.PHONY: maven
maven: maven-fluig maven-lms maven-boards

# Rule "docker-fluig"
.PHONY: docker-fluig
docker-fluig:
	cd fluig/docker && $(MAKE) build:local && cd ../..

# Rule "docker-lms"
.PHONY: docker-lms
docker-lms:
	cd lms/docker && $(MAKE) build:local && cd ../..

# Rule "docker-boards"
.PHONY: docker-boards
docker-boards:
	cd boards/boards/docker && $(MAKE) build:local && cd ../../..

# Rule "docker"
.PHONY: docker
docker: docker-fluig docker-lms docker-boards

# Rule "fluig"
.PHONY: fluig
fluig: maven-fluig docker-fluig

# Rule "lms"
.PHONY: lms
lms: maven-lms docker-lms

# Rule "boards"
.PHONY: boards
boards: maven-boards docker-boards

# Rule "build"
.PHONY: build
build:
	if [ -f boards-widget/Makefile ]; then \
	    cd boards-widget && make -s build -e LOCAL=true -e VERSION=local || true && cd ..; \
	fi; \
	if [ -f learning-widget/Makefile ]; then \
	    cd learning-widget && make -s build -e LOCAL=true -e VERSION=local || true && cd ..; \
	fi; \
	if [ -f boards/Makefile ]; then \
	    cd boards && make -s build -e LOCAL=true -e VERSION=local || true && cd ..; \
	fi; \
	if [ -f lms/Makefile ]; then \
	    cd lms && make -s build -e LOCAL=true -e VERSION=local || true && cd ..; \
	fi; \
	if [ -f fluig/Makefile ]; then \
	    cd fluig && make -s build -e LOCAL=true -e VERSION=local || true && cd ..; \
	fi

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

# Rule "run-minimal-db"
.PHONY: run-minimal-db
run-minimal-db:
	cd docker-minimal && docker-compose -f docker-db.yml up

# Rule "stop-minimal-db"
.PHONY: stop-minimal-db
stop-minimal-db:
	cd docker-minimal && docker-compose -f docker-db.yml down

# Rule "run-minimal-app"
.PHONY: run-minimal-app
run-minimal-app:
	cd docker-minimal && docker-compose -f docker-app.yml up

# Rule "stop-minimal-app"
.PHONY: stop-minimal-app
stop-minimal-app:
	cd docker-minimal && docker-compose -f docker-app.yml down

# Rule "clear-minimal-volume"
.PHONY: clear-minimal-volume
clear-minimal-volume:
	cd docker-minimal && docker system prune --volumes -f && sudo rm -rf volume && mkdir volume && chmod 777 volume

# Rule "gitclone"
.PHONY: gitclone
gitclone:
	git clone ssh://git@git.fluig.com:7999/fp/fluig.git ; \
	git clone ssh://git@git.fluig.com:7999/lms/lms.git ; \
	git clone ssh://git@git.fluig.com:7999/lms/learning-widget.git ; \
	git clone ssh://git@git.fluig.com:7999/fb/boards.git ; \
	git clone ssh://git@git.fluig.com:7999/fb/boards-widget.git
