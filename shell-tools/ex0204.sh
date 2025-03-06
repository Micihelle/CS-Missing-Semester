#!/usr/bin/env bash
# Program:
# 1.find "*.HTML" from all the files STDIN `tar`
# 2.take inpits from arguments(-d terminated by the specified charater
# History:
# 2023/02/26

find . -name '*.html' | xargs -d '\n' tar -cvzf html.zip

