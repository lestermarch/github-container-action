#!/bin/sh

# Echo the "greeting" input variable
echo "Hello $INPUT_GREETING"

# Create a "memory" output variable
MEMORY=$(cat /proc/meminfo)
echo "::set-output name=memory::$MEMORY"
