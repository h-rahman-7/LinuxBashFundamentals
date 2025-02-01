#!/bin/bash  # Use Bash to run this script

fruits=("apple" "banana" "orange")  # Create an array of fruits
index=0  # Start at the first item (position 0)

while [ $index -lt ${#fruits[@]} ]  # Loop while index is less than the number of fruits
do
    echo "Fruit: ${fruits[$index]}"  # Print the fruit at position "index"
    ((index++))  # Increase index by 1
done  # End of loop
