#!/bin/sh

MY_VAR=hello # Note there can be no spaces around the =
MY_NUM=1234

echo $MY_VAR
echo "MY_VAR is $MY_VAR"

# Note you should quote variables with spaces in them, or they'll be replaced and treated as separate arguments.
echo ''
MY_VAR_SPACES="demo_space_hello demo_space_with demo_space_spaces"
echo 'printf "%s \\n" $MY_VAR_SPACES:'
printf "%s \n" $MY_VAR_SPACES # This unquoted use will end up with each word on separate lines.

echo ''
echo 'printf "%s \\n" "$MY_VAR_SPACES":'
printf "%s \n" "$MY_VAR_SPACES" # This unquoted use will end up with the entire variable on the same line.
echo ''

# Another example with touch, the first line will end up making 3 files.
touch ${MY_VAR_SPACES}_touch
touch "${MY_VAR_SPACES}_touch"

# Read an un-declared variable is empty, not an error.
echo "VAR_X: $VAR_X"
VAR_X=1000
echo "VAR_X: $VAR_X"
echo ''

# Export will allow a variable defined in the current shell to be available to descendent shells.
# Run VAR_Y=2000 and run this script, observe VAR_Y is empty.
# Then run export VAR_Y (or export VAR_Y=2000) and run this script, observe VAR_Y is 2000.
echo "VAR_Y: $VAR_Y"
echo ''

# You can run a script without creating a child shell by running: . ./variables.sh (source ./variables.sh in bash)
# This allows variables set in the script to be set in the current shell.

# You can use ${} to disambiguate a variable reference if you want to use it for e.g. as part of a file name:
VAR_A='nested_var'
touch "demo_nested_$VAR_A_file" # This just returns as it tries to lookup the variable $VAR_A_file.
touch "demo_nested_${VAR_A}_file" # This looks up the variable VAR_A, then joins that with the rest of the string.
echo ''

# You can default a variable with {:-}
echo "Default val: ${VAR_MISSING:-"default"}"
echo "Default val: ${VAR_MISSING:-"$(date)"}" # With expression
echo "Default val: ${VAR_MISSING:-"whoami:$(whoami)"}" # With string + expression

# You can default and set a variable to that default with {:=}
echo "Default val: ${VAR_MISSING:="now set"}"
echo "Default val: ${VAR_MISSING:="set again?"}"
echo ''

# You can set a variable from the CLI with read
echo What is your name?
read MY_NAME
echo "Hello $MY_NAME"