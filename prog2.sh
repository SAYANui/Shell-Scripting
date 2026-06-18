#!/bin/bash

# Prompt user for input if not provided as an argument
if [ -z "$1" ]; then
    read -p "Enter an integer to check: " num
else
    num=$1
fi

# Validate that the input is a positive integer
if [[ ! "$num" =~ ^[0-9]+$ ]]; then
    echo "Error: Please enter a valid non-negative integer."
    exit 1
fi

# Base cases for 0 and 1
if [ "$num" -eq 0 ] || [ "$num" -eq 1 ]; then
    echo "Yes, $num is a Fibonacci number."
    exit 0
fi

# Initialize the first two Fibonacci numbers
a=0
b=1
c=1

# Generate Fibonacci numbers until we reach or exceed the input
while [ "$c" -lt "$num" ]; do
    c=$((a + b))
    a=$b
    b=$c
done

# Check if the number we arrived at matches the input
if [ "$c" -eq "$num" ]; then
    echo "Yes, $num is a Fibonacci number."
else
    echo "No, $num is NOT a Fibonacci number."
fi