#!/bin/bash

validate_age() {                                                # declare a function called validate_age
    local age=$1                                                # declare a local variable called age   

    if [[ ! $age =~ ^[0-9]+$ ]]; then                           # checks if variable age is a number. if it's not a number, it will say invalidate age, please provide a numeric value           
        echo "Invalid age. Please provide a numeric value."
        return 1
    fi

    if (( age < 18)); then
        echo "Sorry, you must be at least 18 years old."
        return 1
    fi


echo "Congratulations! You are eligible."                       # print out the message "Congratulations! You are eligible to vote."
return 0                                                        # return 0
}

echo "Please enter your age: "
read user_age                                                   # ask the user to enter their age and store it in the variable user_age         

validate_age "$user_age"                                        # call the function validate_age and pass in the user_age as a parameter
exit_code=$?                                                    # store the exit code of the validate_age function in a variable called exit_code    

if (( exit_code != 0)); then
    echo "Input validation failed."
else 
    echo "Validation passed!"
fi