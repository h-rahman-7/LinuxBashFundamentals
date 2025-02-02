#!/bin/bash

print_args() {
    echo "Number of arguments: $#"
    echo "Name of script: $0"
    echo "First argument: $1"
    echo "Second argument: $2"
    echo "All arguments: $@"
}

print_args "Alice" "Bob" "Ahmed"