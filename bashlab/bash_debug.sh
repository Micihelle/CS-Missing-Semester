#!/bin/bash
# Program:
# some useful methods of debugging Bash scripts
# History:
# 2025/02/10

# Using Traditional Techniques
echo "function_name(): value of \\$var is ${var}"

# other Bash options:try the -u switch 
name="Joe"; age=28; level=7;
for x in $name $age $score;
	do echo $x;
done  
