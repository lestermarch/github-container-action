#!/bin/sh

# Example input variable
echo "Hello $INPUT_MYINPUT"

# Example output variable
MEMORY=$(cat /proc/meminfo)
echo "::set-output name=memory::$MEMORY"
