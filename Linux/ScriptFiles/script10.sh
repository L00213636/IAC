#!/bin/bash
# By: Pawan Venugopal
# Date: 16NOV26
# Function: Simple number check
# Script: script10

echo "Please type in a number"
read X

# Check if less than
if [ "$X" -lt "0" ]
then
    echo "X is less than zero"
    exit 0
else
    echo "X is greater than zero"
    exit 0
fi
