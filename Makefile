#
# Copyright 2018, TOTVS S.A.
# All rights reserved.
#

SHELL = /bin/bash
BASE_DIR ?= ..
NEXTGEN_BASE_DIR ?= ${BASE_DIR}/fluig-nextgen
CORE_BASE_DIR ?= ${BASE_DIR}/fluig-core
ONPREMISE_BASE_DIR ?= ${BASE_DIR}/fluig-onpremise
IP_ADDR ?= $(shell hostname -I | cut -d ' ' -f 1)

ENABLE_ACCOUNT ?= true
ENABLE_MAESTRO ?= true
ENABLE_I18N ?= true
ENABLE_DISCOVERY ?= true
ENABLE_LEARNINIG ?= true
ENABLE_BOARDS ?= true
ENABLE_ACCOUNT ?= true

# Rule "prepare-maven"
.PHONY: prepare-maven
prepare-maven:
	cp common/maven/settings.xml ~/.m2/

# Rule "prepare-nextgen"
.PHONY: prepare-nextgen
prepare-nextgen:
	mkdir -p ${NEXTGEN_BASE_DIR} ; \
	cp fluig-nextgen/Makefile ${NEXTGEN_BASE_DIR}/ ; \
	cat common/git/Makefile.gitbranch >> ${NEXTGEN_BASE_DIR}/Makefile ; \
	cat common/git/Makefile.gitclean >> ${NEXTGEN_BASE_DIR}/Makefile ; \
	cat common/git/Makefile.gitmaster >> ${NEXTGEN_BASE_DIR}/Makefile ; \
	cat common/git/Makefile.gitstaging >> ${NEXTGEN_BASE_DIR}/Makefile ; \
	cat common/git/Makefile.gitpull >> ${NEXTGEN_BASE_DIR}/Makefile ; \
	cat common/git/Makefile.gitstatus >> ${NEXTGEN_BASE_DIR}/Makefile ; \
	cat common/docker/Makefile.build-local >> ${NEXTGEN_BASE_DIR}/Makefile ; \
	cat common/docker/Makefile.build-perfmon >> ${NEXTGEN_BASE_DIR}/Makefile ; \
	cat common/maven/Makefile.pom >> ${NEXTGEN_BASE_DIR}/Makefile ; \
	cat common/maven/Makefile.clean-install >> ${NEXTGEN_BASE_DIR}/Makefile ; \
	cat common/maven/Makefile.clean-install-monitor >> ${NEXTGEN_BASE_DIR}/Makefile

# Rule "prepare-core"
.PHONY: prepare-core
prepare-core:
	mkdir -p ${CORE_BASE_DIR} ; \
	cp fluig-core/Makefile ${CORE_BASE_DIR}/ ; \

	cp -R fluig-core/docker-minimal ${CORE_BASE_DIR}/ ; \
	cp -R common/mysql/* ${CORE_BASE_DIR}/docker-minimal ; \
	cp common/docker/Makefile ${CORE_BASE_DIR}/docker-minimal/ ; \
	cp common/public.env ${CORE_BASE_DIR}/docker-minimal/
	cat common/docker/maestro-application.yml >> ${CORE_BASE_DIR}/docker-minimal/docker-app.yml; \
	cat common/docker/manager-application.yml >> ${CORE_BASE_DIR}/docker-minimal/docker-app.yml; \
	cat common/docker/discovery-application.yml >> ${CORE_BASE_DIR}/docker-minimal/docker-app.yml; \
	cat common/docker/i18n-application.yml >> ${CORE_BASE_DIR}/docker-minimal/docker-app.yml; \
	cat common/docker/fluig-application.yml >> ${CORE_BASE_DIR}/docker-minimal/docker-app.yml; \
	cat common/docker/networks.yml >> ${CORE_BASE_DIR}/docker-minimal/docker-app.yml; \
	cat common/docker/discovery-migration.yml >> ${CORE_BASE_DIR}/docker-minimal/docker-migration.yml; \
	cat common/docker/i18n-migration.yml >> ${CORE_BASE_DIR}/docker-minimal/docker-migration.yml; \
	cat common/docker/fluig-migration.yml >> ${CORE_BASE_DIR}/docker-minimal/docker-migration.yml; \
	cat common/docker/networks.yml >> ${CORE_BASE_DIR}/docker-minimal/docker-migration.yml

	cp -R fluig-core/docker ${CORE_BASE_DIR}/ ; \
	cp -R common/mysql/* ${CORE_BASE_DIR}/docker/ ; \
	cp common/docker/Makefile ${CORE_BASE_DIR}/docker/ ; \
	cp common/public.env ${CORE_BASE_DIR}/docker/ ; \
	#cat common/docker/static-server.yml >> ${CORE_BASE_DIR}/docker/docker-app.yml; \
	cat common/docker/accounts-application.yml >> ${CORE_BASE_DIR}/docker/docker-app.yml; \
	cat common/docker/maestro-application.yml >> ${CORE_BASE_DIR}/docker/docker-app.yml; \
	cat common/docker/manager-application.yml >> ${CORE_BASE_DIR}/docker/docker-app.yml; \
	cat common/docker/discovery-application.yml >> ${CORE_BASE_DIR}/docker/docker-app.yml; \
	cat common/docker/i18n-application.yml >> ${CORE_BASE_DIR}/docker/docker-app.yml; \
	cat common/docker/fluig-application.yml >> ${CORE_BASE_DIR}/docker/docker-app.yml; \
	cat common/docker/lms-application.yml >> ${CORE_BASE_DIR}/docker/docker-app.yml; \
	cat common/docker/boards-application.yml >> ${CORE_BASE_DIR}/docker/docker-app.yml; \
	#cat common/docker/scheduling-application.yml >> ${CORE_BASE_DIR}/docker/docker-app.yml; \
	cat common/docker/storage-application.yml >> ${CORE_BASE_DIR}/docker/docker-app.yml; \
	#cat common/docker/comments-application.yml >> ${CORE_BASE_DIR}/docker/docker-app.yml; \
	#cat common/docker/tasks-application.yml >> ${CORE_BASE_DIR}/docker/docker-app.yml; \
	cat common/docker/networks.yml >> ${CORE_BASE_DIR}/docker/docker-app.yml; \
	#cat common/docker/mail-server.yml >> ${CORE_BASE_DIR}/docker/docker-app.yml; \
	cat common/docker/lms-migration.yml >> ${CORE_BASE_DIR}/docker/docker-migration.yml; \
	cat common/docker/discovery-migration.yml >> ${CORE_BASE_DIR}/docker/docker-migration.yml; \
	cat common/docker/i18n-migration.yml >> ${CORE_BASE_DIR}/docker/docker-migration.yml; \
	#cat common/docker/storage-migration.yml >> ${CORE_BASE_DIR}/docker/docker-migration.yml; \
	#cat common/docker/scheduling-migration.yml >> ${CORE_BASE_DIR}/docker/docker-migration.yml; \
	cat common/docker/fluig-migration.yml >> ${CORE_BASE_DIR}/docker/docker-migration.yml; \
	cat common/docker/networks.yml >> ${CORE_BASE_DIR}/docker/docker-migration.yml

	cat common/git/Makefile.gitbranch >> ${CORE_BASE_DIR}/Makefile ; \
	cat common/git/Makefile.gitclean >> ${CORE_BASE_DIR}/Makefile ; \
	cat common/git/Makefile.gitmaster >> ${CORE_BASE_DIR}/Makefile ; \
	cat common/git/Makefile.gitstaging >> ${CORE_BASE_DIR}/Makefile ; \
	cat common/git/Makefile.gitpull >> ${CORE_BASE_DIR}/Makefile ; \
	cat common/git/Makefile.gitstatus >> ${CORE_BASE_DIR}/Makefile ; \
	cat common/maven/Makefile.pom >> ${CORE_BASE_DIR}/Makefile ; \
	cat common/maven/Makefile.clean-install >> ${CORE_BASE_DIR}/Makefile

# Rule "prepare-onpremise"
.PHONY: prepare-onpremise
prepare-onpremise:
	mkdir -p ${ONPREMISE_BASE_DIR} ; \
	cp fluig-onpremise/Makefile ${ONPREMISE_BASE_DIR}/ ; \
	cat common/git/Makefile.gitbranch >> ${ONPREMISE_BASE_DIR}/Makefile ; \
	cat common/git/Makefile.gitclean >> ${ONPREMISE_BASE_DIR}/Makefile ; \
	cat common/git/Makefile.gitmaster >> ${ONPREMISE_BASE_DIR}/Makefile ; \
	cat common/git/Makefile.gitstaging >> ${ONPREMISE_BASE_DIR}/Makefile ; \
	cat common/git/Makefile.gitdevelop >> ${ONPREMISE_BASE_DIR}/Makefile ; \
	cat common/git/Makefile.gitpull >> ${ONPREMISE_BASE_DIR}/Makefile ; \
	cat common/git/Makefile.gitstatus >> ${ONPREMISE_BASE_DIR}/Makefile ; \
	cat common/maven/Makefile.pom >> ${ONPREMISE_BASE_DIR}/Makefile ; \
	cat common/maven/Makefile.clean-install >> ${ONPREMISE_BASE_DIR}/Makefile
