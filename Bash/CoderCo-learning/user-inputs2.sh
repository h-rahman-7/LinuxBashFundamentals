#!/bin/bash

greet() {
    local name                      # declare a local variable called name

    if [ $# -eq 0 ]; then            # if the number of arguments passed in when running the script is equal to 0
        echo "What is your name?"   # ask the user for their name
        read name                    # reads the user's input and store it in the variable name. Without read, the script wouldn't be able to capture what the user types.
    else
        name="$1"                    # if the number of arguments passed in is not equal to 0, then make the local variable name equal to the first argument passed in
    fi

    echo "Hello, $name!"

}

greet