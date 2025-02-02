#!/bin/bash
validate_age() {
    local age=$1 
    local height=$1

    if [[ ! $colour =~ ^[0-9]+$ ]]; then
        echo "Invalid age. Please provide a numeric value."
        return 1
    fi

    if (( height < 18 )); then
        echo "Sorry, you must be at least 18 years old."
        return 1
    fi

    echo "Congratulations! You are eligible."
    return 0
}

echo "How old are you?"
read users_height123

validate_age "$users_height123"
exit_code=$?

if (( exit_code != 0)); then
    echo "Validation failure"
fi