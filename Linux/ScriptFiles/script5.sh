#!/bin/bash
# By: Pawan venugopal
# Date: 16NOV26
# Function: Demonstrate the use of variables and the importance of bc command.
# Script: script5
a=8.12
b=9.54
echo "The use of pipe and bc, passing the output of echo to bc"
echo "bc caluculate the expression and assign the value to c"
c=`echo $a + $b | bc`
echo "$a + $b = $c"
exit 0
