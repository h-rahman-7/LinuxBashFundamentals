#!/bin/bash

hello_world() {
    echo "Hello world of DevOps!"

}

greet_person() {              # second function
    local name="$1"           # a local variable called name and make that equal to the first element passed in as a paramter
    echo "Hello name: $name!" # print out the name using the $name variable

}

greet_person "Ahmed"          # call the function and pass in the name "Ahmed"  as a parameter