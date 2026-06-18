#!/bin/bash

# Prompt user for input if not provided as an argument
if [ -z "$1" ]; then
    read -p "Enter an integer to check: " num
else
    num=$1
fi

# Validate input (must be a positive integer)
if [[ ! "$num" =~ ^[0-9]+$ ]]; then
    echo "Error: Please enter a valid non-negative integer."
    exit 1
fi

# Find the number of digits (length of the string)
power=${#num}

# Duplicate the original number to work with
temp=$num
sum=0

# Loop to extract each digit and raise it to the power
while [ $temp -gt 0 ]; do
    # Get the last digit using the remainder (modulo) operator
    digit=$(( temp % 10 ))
    
    # Calculate digit^power manually
    digit_power=1
    for (( i=0; i<power; i++ )); do
        digit_power=$(( digit_power * digit ))
    done
    
    # Add to the running total
    sum=$(( sum + digit_power ))
    
    # Remove the last digit from temp
    temp=$(( temp / 10 ))
done

# Check if the sum matches the original number
if [ $sum -eq $num ]; then
    echo "Yes, $num is an Armstrong number."
else
    echo "No, $num is NOT an Armstrong number."
fi