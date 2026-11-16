#!/bin/bash
# By: Pawan venugopal
# Date: 16NOV26
# Function: Show users who are logged on
# Script: script8

INPUT_STRING=hello 
while [ "$INPUT_STRING" != "bye" ] 
do   
    echo "Please type something in (bye to quit)"   
    read INPUT_STRING   
    echo "You typed: $INPUT_STRING" 
done
exit 0
