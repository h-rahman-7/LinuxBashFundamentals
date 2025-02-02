#!/bin/bash

command -v git 2>/dev/null                                              # -v checks if commands exists in the system. 2>/dev/null silences the error ouputs 

if [[ $? -ne 0 ]]; then                                                 # $? is a special variable that holds the exit status of the last command. If the exit status is not 0, then the command failed.
    echo "git is not installed. Please install git and try again."
    exit 1
else 
    echo "git is installed."
fi