#!/bin/bash

greet_user() {
    echo "What is your name?" # ask the user for their name
    read name                # reads the user's input and store it in the variable name. Without read, the script wouldn't be able to capture what the user types.
    echo "Hello $name!"      # print out the user's name they have provided
}

greet_user