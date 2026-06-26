#!/bin/bash

# 1. Create the text file with your text
echo "hello oi dekh lawre" > message.txt
echo "File 'message.txt' created. Check your sidebar now!"

# 2. Countdown timer for 10 seconds
echo -n "Holding file for 10 seconds..."
for i in {10..1}; do
    echo -n " $i"
    sleep 1
done
echo "" # Just prints a new line

# 3. Redo / Clean up (delete the file)
rm message.txt
echo "Time's up! 'message.txt' has been deleted and everything is reset."