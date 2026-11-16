#!/bin/bash
# By: Pawan Venugopal
# Date: 16NOV26
# Function: Simple number check with seq command
# Script: script11

for indexnumber in `seq 3`
do
    touch TextFile$indexnumber.txt
done
