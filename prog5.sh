#!/bin/bash

# Ask the user for their name
echo "What is your name, bro?"
read user_name

# Greet the user
echo "Welcome to the matrix, $user_name."

# Ask what file they want to create
echo "Enter a name for your new text file (e.g., test.txt):"
read file_name

# Create it
echo "This file was created dynamically by $user_name!" > "$file_name"
echo "Done! Check your sidebar for '$file_name'."