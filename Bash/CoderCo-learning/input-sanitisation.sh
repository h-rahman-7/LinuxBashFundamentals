#!/bin/bash

# This script will sanitise the input from the user
sanitise_input() {                                              # declare a function called sanitise_input
    local input=$1                                              # declare a local variable called input and make that equal to the first argument passed in                                    
    local sanitise_input=${input//[^a-zA-Z0-9]/}                # declare a local variable called sanitise_input and make that equal to the input with all characters that are not a letter or a number removed                          

    echo "$sanitised_input"                                     # print out the sanitised input

}

