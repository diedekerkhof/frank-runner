#!/bin/bash
# This file is generated by build.xml
FR_DIR="`pwd`/${BASH_SOURCE%/*}/"
if [[ ! -d "${FR_DIR}download/" ]]; then
	mkdir "${FR_DIR}download/"
fi
if [[ ! -d "${FR_DIR}build/tmp/build/" ]]; then
	mkdir -p "${FR_DIR}build/tmp/build"
fi
ZIP=OpenJDK8U-jdk_x64_linux_hotspot_8u292b10.tar.gz
URL=https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u292-b10/OpenJDK8U-jdk_x64_linux_hotspot_8u292b10.tar.gz
DIR=build/jdk8u292-b10
if [[ "$OSTYPE" == "darwin"* ]]; then
	ZIP=${ZIP/linux/mac}
	URL=${URL/linux/mac}
fi
DOWNLOAD_HELP="download ${URL} manually, move it to ${FR_DIR}download and restart this script"
if [[ ! -f "${FR_DIR}download/${ZIP}" ]]; then
	echo In case of errors ${DOWNLOAD_HELP}
	curl -f -o "${FR_DIR}download/${ZIP}.tmp" -L ${URL}
	retVal=$?
	if [[ $retVal -ne 0 ]]; then
		echo "Please ${DOWNLOAD_HELP}"
		exit $retVal
	fi
	mv "${FR_DIR}download/${ZIP}.tmp" "${FR_DIR}/download/${ZIP}"
fi
if [[ ! -d "${FR_DIR}${DIR}/" ]]; then
	tar --exclude=*/demo --exclude=*/sample --exclude=*/manual --exclude=*/src.zip -xzvf "${FR_DIR}download/${ZIP}" -C "${FR_DIR}build/tmp/build"
	retVal=$?
	if [[ $retVal -ne 0 ]]; then
		echo "Please ${DOWNLOAD_HELP}"
		exit $retVal
	fi
	mv "${FR_DIR}build/tmp/${DIR}" "${FR_DIR}${DIR}"
fi
ZIP=apache-ant-1.10.10-bin.tar.gz
URL=https://archive.apache.org/dist/ant/binaries/apache-ant-1.10.10-bin.tar.gz
DIR=build/apache-ant-1.10.10
DOWNLOAD_HELP="download ${URL} manually, move it to ${FR_DIR}download and restart this script"
if [[ ! -f "${FR_DIR}download/${ZIP}" ]]; then
	echo In case of errors ${DOWNLOAD_HELP}
	curl -f -o "${FR_DIR}download/${ZIP}.tmp" -L ${URL}
	retVal=$?
	if [[ $retVal -ne 0 ]]; then
		echo "Please ${DOWNLOAD_HELP}"
		exit $retVal
	fi
	mv "${FR_DIR}download/${ZIP}.tmp" "${FR_DIR}/download/${ZIP}"
fi
if [[ ! -d "${FR_DIR}${DIR}/" ]]; then
	tar --exclude=*/demo --exclude=*/sample --exclude=*/manual --exclude=*/src.zip -xzvf "${FR_DIR}download/${ZIP}" -C "${FR_DIR}build/tmp/build"
	retVal=$?
	if [[ $retVal -ne 0 ]]; then
		echo "Please ${DOWNLOAD_HELP}"
		exit $retVal
	fi
	mv "${FR_DIR}build/tmp/${DIR}" "${FR_DIR}${DIR}"
fi
export JAVA_HOME="${FR_DIR}build/jdk8u292-b10"
export ANT_HOME="${FR_DIR}build/apache-ant-1.10.10"
"${FR_DIR}build/apache-ant-1.10.10/bin/ant" -emacs -buildfile "${FR_DIR}build.xml" "$@" start