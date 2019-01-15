#
# Copyright 2018, TOTVS S.A.
# All rights reserved.
#

SHELL = /bin/bash

# Rule "build"
.PHONY: build
build: mvn-clean-install docker-build-local

# Rule "build:monitor"
.PHONY: build\:monitor
build\:monitor: mvn-clean-install\:monitor docker-build-local

# Rule "build:perfmon"
.PHONY: build\:perfmon
build\:perfmon: mvn-clean-install docker-build-perfmon

# Rule "run-demo-db"
.PHONY: run-demo-db
run-demo-db:
	cd fluig-demo/docker && docker-compose -f docker-db.yml up

# Rule "run-demo-app"
.PHONY: run-demo-app
run-demo-app:
	cd fluig-demo/docker && docker-compose -f docker-app.yml up

# Rule "gitclone-core"
.PHONY: gitclone-core
gitclone-core:
	git clone ssh://git@git.fluig.com:7999/fn/fluig-api.git ; \
	git clone ssh://git@git.fluig.com:7999/fn/fluig-comments.git ; \
	git clone ssh://git@git.fluig.com:7999/fn/fluig-commons-client.git ; \
	git clone ssh://git@git.fluig.com:7999/fn/fluig-communication.git ; \
	git clone ssh://git@git.fluig.com:7999/fn/fluig-core.git ; \
	git clone ssh://git@git.fluig.com:7999/fn/fluig-database-update.git ; \
	git clone ssh://git@git.fluig.com:7999/fn/fluig-demo.git ; \
	git clone ssh://git@git.fluig.com:7999/fn/fluig-discovery.git ; \
	git clone ssh://git@git.fluig.com:7999/fn/fluig-i18n.git ; \
	git clone ssh://git@git.fluig.com:7999/fn/fluig-persistence.git ; \
	git clone ssh://git@git.fluig.com:7999/fn/fluig-resource-server.git ; \
	git clone ssh://git@git.fluig.com:7999/fn/fluig-scheduling.git ; \
	git clone ssh://git@git.fluig.com:7999/fn/fluig-starter.git ; \
	git clone ssh://git@git.fluig.com:7999/fn/fluig-storage.git ; \
	git clone ssh://git@git.fluig.com:7999/fn/fluig-test.git
