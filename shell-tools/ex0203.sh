#!/usr/bin/env bash
# Program:
# capture the output(failure)n!=42
# History:
# 2023/02/26
n=$(( RANDOM % 100 ))
len=0

while [ "${n}" -ne "42" ]
do
    len=$[$len+1]
    n=$(( RANDOM % 100 ))
    $n >> test.log 2>> test.log
done

echo "The error was using magic numbers"
echo "Everything went according to plan"
echo "The run times is $len" >> test.log
