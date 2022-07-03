#!/bin/bash

FILENAME=${1}

echo "---------------------------------"


if [ -n "$1" ]
# 명령어줄 인자가 존재하는지 테스트(non-empty).
then
	WORK_FILE=${FILENAME}
else  
	echo "usage : ./ch.03.if.sh [FILENAME]"
	exit 66
fi  

echo "WORK_FILE = ${WORK_FILE}"
