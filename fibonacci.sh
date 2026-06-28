#!/bin/bash

# Prompt the user for the number of terms
read -p "Enter the number of terms for the Fibonacci sequence: " terms

# Validate input to ensure it's a positive integer
if [[ ! "$terms" =~ ^[0-9]+$ ]] || [ "$terms" -le 0 ]; then
    echo "Please enter a valid positive integer."
    exit 1
fi

# Initialize the first two terms
a=0
b=1

echo "The Fibonacci sequence up to $terms terms is:"

for (( i=0; i<terms; i++ ))
do
    echo -n "$a "
    # Calculate the next term
    fn=$((a + b))
    a=$b
    b=$fn
done

# Print a final newline
echo ""