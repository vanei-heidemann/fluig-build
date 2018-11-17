#
# Copyright 2018, TOTVS S.A.
# All rights reserved.
#

SHELL = /bin/bash
BASE_DIR = ..
NEXTGEN_BASE_DIR = ${BASE_DIR}/fluig-nextgen
PLATFORM_BASE_DIR = ${BASE_DIR}/fluig-platform
ONPREMISE_BASE_DIR = ${BASE_DIR}/fluig-onpremise

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
	cat common/maven/Makefile.pom >> ${NEXTGEN_BASE_DIR}/Makefile ; \
	cat common/maven/Makefile.clean-install >> ${NEXTGEN_BASE_DIR}/Makefile ; \
	cat common/maven/Makefile.clean-install-monitor >> ${NEXTGEN_BASE_DIR}/Makefile

# Rule "prepare-platform"
.PHONY: prepare-platform
prepare-platform:
	mkdir -p ${PLATFORM_BASE_DIR} ; \
	cp fluig-platform/Makefile ${PLATFORM_BASE_DIR}/ ; \
	cat common/git/Makefile.gitbranch >> ${PLATFORM_BASE_DIR}/Makefile ; \
	cat common/git/Makefile.gitclean >> ${PLATFORM_BASE_DIR}/Makefile ; \
	cat common/git/Makefile.gitmaster >> ${PLATFORM_BASE_DIR}/Makefile ; \
	cat common/git/Makefile.gitpull >> ${PLATFORM_BASE_DIR}/Makefile ; \
	cat common/git/Makefile.gitstatus >> ${PLATFORM_BASE_DIR}/Makefile ; \
	cat common/maven/Makefile.pom >> ${PLATFORM_BASE_DIR}/Makefile ; \
	cat common/maven/Makefile.clean-install >> ${PLATFORM_BASE_DIR}/Makefile

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
