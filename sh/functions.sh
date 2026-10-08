#!/bin/sh

# We can import functions defined in other files.
. ./functions-lib.sh
my_lib_func

# Simple function
my_func() {
  echo "This is my_func"
}
# Note you invoke a function without brackets.
my_func
my_func
echo ''

# A function with arguments
my_func_args() {
  ARG_1=$1
  ARG_2=$2
  shift; shift; # Remove the first two args
  REST=$@ # Then we can put the rest of the args into a variables

  echo "ARG_1: $ARG_1"
  echo "ARG_2: $ARG_2"
  echo "REST: $REST"
  for r in "$@"
  do
    echo "REST arg: $r"
  done
}
echo 'my_func_args aa bb cc dd ee'
my_func_args aa bb cc dd ee
echo ''

echo 'my_func_args 11 22 33 44 55'
my_func_args 11 22 33 44 55
echo ''

# Functions get their own positional parameters. Even if you invoke
# `sh ./functions.sh a b c`, calling my_func_args without arguments does not
# pass the script arguments to it. Pass them explicitly with my_func_args "$@".
echo 'my_func_args'
my_func_args
echo ''

# Variables are not scoped to functions
A=1
var_func() {
  echo "var_func - A: $A"
  A=2
  B=1
}
var_func
echo "main script - A: $A"
echo "main script - B: $B"

# You can return values from functions.
# But note they return as exit status codes not stdout. So you can read them with $?, but not assign them to a variable directly.
is_a() {
  if [ "$#" -eq 0 ]; then
    return 1
  elif [ "$1" = 'a' ]; then
    return 0
  else
    return 1
  fi
}

is_a
echo "is_a: status=$?"

is_a 'a'
echo "is_a 'a': status=$?"

# Functions can output arbitrary values, including values containing spaces.
get_file_name() {
  printf '%s\n' 'file name with spaces.txt'
}
FILE_NAME=$(get_file_name)
echo "get_file_name returned: $FILE_NAME"
