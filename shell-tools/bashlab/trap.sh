#!/bin/bash
# Program:
# some useful methods of debugging Bash scripts
# History:
# 2025/02/11

trap 'echo score is $score, status is $status' EXIT

if [ -z $1 ]; then
	status="default"
else
	status=$1
fi

score=0
if [ ${USER} = 'superman' ]; then
	score=99
elif [ $# -gt 1 ]; then
	score=$2
fi

