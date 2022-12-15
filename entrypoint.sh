#!/bin/sh

# Example input variable
echo "Hello $INPUT_GREETING"

# Example output variable
MEMORY=$(cat /proc/meminfo)
echo "::set-output name=memory::$MEMORY"
