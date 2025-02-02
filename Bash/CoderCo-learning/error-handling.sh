#!/bin/bash

num1=10
num2=0

if [ $num2 -eq 0 ]; then
    echo "Error: divison by zero is not allowed"
    exit 1
fi

result=$((num1 / num2))

echo "Result: $result"
# In this script, we are trying to divide num1 by num2. If num2 is equal to 0, we print an error message and exit the script with a status code of 1. This is an example of error handling in a bash script.