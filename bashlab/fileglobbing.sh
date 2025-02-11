#!/bin/bash
# Program:
# diff the turn on the fileglobbing option and turn off the fileglobbing option
# History:
# 2025/02/11

echo "ignore fileglobbing option turned off"
ls *

echo "ignore file globbing option set"
set -f
ls *
set +f

