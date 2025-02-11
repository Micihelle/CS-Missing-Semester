#!/bin/bash
# Program:
# some useful methods of debugging Bash scripts
# History:
# 2025/02/11

read -p "Path to be added: " path

set -xv
if [ "$path" = "/home/mike/bin" ]; then
	echo $path >> $PATH
	echo "new path: $PATH"
else
	echo "did not modify PATH"
fi
set +xv
