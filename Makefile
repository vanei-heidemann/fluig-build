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
	mkdir ${CORE_BASE_DIR}/docker-minimal/volume ; \
	chmod 777 ${CORE_BASE_DIR}/docker-minimal/volume ; \
	sed -i -- 's/IP_ADDR/${IP_ADDR}/g' ${CORE_BASE_DIR}/docker-minimal/*.yml

	cp -R fluig-core/docker-boards ${CORE_BASE_DIR}/ ; \
	mkdir ${CORE_BASE_DIR}/docker-boards/volume ; \
	chmod 777 ${CORE_BASE_DIR}/docker-boards/volume ; \
	sed -i -- 's/IP_ADDR/${IP_ADDR}/g' ${CORE_BASE_DIR}/docker-boards/*.yml

	cp -R fluig-core/docker ${CORE_BASE_DIR}/ ; \
	mkdir ${CORE_BASE_DIR}/docker/volume ; \
	chmod 777 ${CORE_BASE_DIR}/docker/volume ; \
	sed -i -- 's/IP_ADDR/${IP_ADDR}/g' ${CORE_BASE_DIR}/docker/*.yml

	cat common/git/Makefile.gitbranch >> ${CORE_BASE_DIR}/Makefile ; \
	cat common/git/Makefile.gitclean >> ${CORE_BASE_DIR}/Makefile ; \
	cat common/git/Makefile.gitmaster >> ${CORE_BASE_DIR}/Makefile ; \
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
	cat common/git/Makefile.gitdevelop >> ${ONPREMISE_BASE_DIR}/Makefile ; \
	cat common/git/Makefile.gitpull >> ${ONPREMISE_BASE_DIR}/Makefile ; \
	cat common/git/Makefile.gitstatus >> ${ONPREMISE_BASE_DIR}/Makefile ; \
	cat common/maven/Makefile.pom >> ${ONPREMISE_BASE_DIR}/Makefile ; \
	cat common/maven/Makefile.clean-install >> ${ONPREMISE_BASE_DIR}/Makefile
