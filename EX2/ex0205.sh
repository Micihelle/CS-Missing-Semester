#!/usr/bin/env bash
# Program:
# recursively find the most recently modified file in a directory.
# History:
# 2023/02/26

#ls -lt | find -daystart -mtime -7

find . -type f -print0 | xargs -0 ls -{l,t,c} #| head -1
# file STDIN from find program (null character instead of whitespace) (Linux character transform)


