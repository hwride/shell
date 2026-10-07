#!/bin/sh

# Run: sh ./special-parameters.sh one "two words" three
echo '$0 - The name used to invoke the shell or script'
echo "$0"
echo ''

echo '$1, $2, ... - Positional parameters passed to the script'
echo "\$1: $1"
echo "\$2: $2"
echo ''

echo '$# - The number of positional parameters'
echo "$#"
echo ''

echo '"$@" - All positional parameters as separate arguments'
for argument in "$@"
do
  echo "<$argument>"
done
echo ''

echo '"$*" - All positional parameters as one argument'
for argument in "$*"
do
  echo "<$argument>"
done
echo ''

echo '$? - The exit status of the most recent pipeline'
false
echo "$?"
echo ''

echo '$$ - The process ID of the current shell'
echo "$$"
echo ''

echo '$! - The process ID of the most recent background command'
sleep 1 &
echo "$!"
wait "$!"
echo ''
