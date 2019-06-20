#
# Copyright 2018, TOTVS S.A.
# All rights reserved.
#

SHELL = /bin/bash
FLUIG_REPOSITORY ?= docker.fluig.com/

# Rule "maven-fluig"
.PHONY: maven-fluig
maven-fluig:
	cd fluig && mvn -DskipTests=true clean install && $(MAKE) artifacts:generate && cd ..

# Rule "maven-lms"
.PHONY: maven-lms
maven-lms:
	cd lms && make -s maven:build -f MakeUtils -e MVN_ARGS="-DskipTests -DskipITs -Ddocker.skip.build -U -Dlms.tag=LOCAL -Ddocker.repository=${FLUIG_REPOSITORY}" && make artifacts:generate && make -s docker:build -f MakeUtils && cd ..

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
	cd fluig/docker && $(MAKE) build -e VERSION=local -e LOCAL=1 && cd ../..

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
	    cd boards-widget && mvn clean install || true && cd ..; \
	fi; \
	if [ -f learning-widget/Makefile ]; then \
	    cd learning-widget && mvn clean install || true && cd ..; \
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

# Rule "gitclone"
.PHONY: gitclone
gitclone:
	git clone ssh://git@git.fluig.com:7999/fp/fluig.git ; \
	git clone ssh://git@git.fluig.com:7999/lms/lms.git ; \
	git clone ssh://git@git.fluig.com:7999/lms/learning-widget.git ; \
	git clone ssh://git@git.fluig.com:7999/fb/boards.git ; \
	git clone ssh://git@git.fluig.com:7999/fb/boards-widget.git
