#!/bin/bash

# Remember spaces before and after '=' tells the script this is a variable assignment, whilst a space before and after tells the script this is a command.

greeting="Hello world"                  # string
count=42                                # integer
fruits=("apple", "banana", "cherry")    # array
name="Nasim"

echo $greeting
echo $count
echo ${fruit}
echo "Hello, $name"