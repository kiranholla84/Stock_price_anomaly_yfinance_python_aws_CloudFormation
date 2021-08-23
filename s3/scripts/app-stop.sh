#!/bin/bash

pid=pgrep -f raw_data.py
if [ "$pid" != "" ]
then # Kill the running process
kill -9 $pid 2>/dev/null || :
fi
