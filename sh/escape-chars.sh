#!/bin/sh

echo Hello World
echo Hello       World
echo "Hello       World"
# You can escape with backslash:
echo "Hello      escaped slash: \"World\", escaped var: \$MY_VAR, escaped backslash: \\"
# This is interpreted as 3 params: "Hello    ", World, "" - so no quotes in the output.
echo "Hello       " World ""
# This is interpreted as 1 params: "Hello    "World""
echo "Hello       "World""

echo "echo *:"
echo *
echo "echo *md:"
echo *md
echo "echo \"*md\":"
echo "*md"