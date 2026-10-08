#!/bin/sh

# if expression; then expression; fi
if [ 1 -eq 1 ]
then
  echo "1 equals 1"
fi

# one-liner example, also demo =
if [ 1 = 1 ]; then echo "1 still equals 1"; fi

# if expression; then expression; else expression; fi
if test 1 -gt 2
then
  echo "1 > 2"
else
  echo "1 is not > 2"
fi

# one-liner example
if [ 1 -gt 2 ]; then echo "1 > 2"; else echo "1 is still not > 2"; fi

# if expression; then expression; elif expression; then expression; else expression; fi
if [ 2 -lt 1 ]; then
  echo "2 < 1"
elif test 2 -lt 3; then
  echo "2 < 3"
else
  echo "2 is not < 1"
fi

# && runs the next command if the one on the left returns a 0 exit code
X=0
[ "$X" = "0" ] && echo "X = 0"
S="hello"
[ "$X" -lt 5 ] && echo "X < 5"
[ "$S" = "hello" ] && echo "S = \"hello\""
# -eq is only for numbers, the below gives: [: hello: integer expression expected
#[ "$S" -eq "hello" ] && echo "S -eq \"hello\""
[ "$S" != "bye" ] && echo "S != \"bye\""
test -n "$S" && echo "S is of non-zero length"

# || runs the next command if the one on the left returns a non-zero exit code
[ "hi" == "bye" ] || echo "\"hi\" != \"bye\""

# If && and || are chained they run left to right.
[ -f "conditions.sh" ] && \
      echo "conditions.sh is a file" || \
      echo "conditions.sh is not a file"
[ -f "xyz" ] && echo "xyz is a file" || echo "xyz is not a file"

test -x "conditions.sh" && echo 'conditions.sh is an executable file'

# you can also use && as a boolean operator in a condition
[ 1 -eq 1 ] && [ 2 -eq 2 ] && echo '1 -eq 1 && 2 -eq 2'
[ 1 -eq 2 ] && [ 2 -eq 2 ] && echo '1 -eq 2 && 2 -eq 2'
[ 1 -eq 2 ] || [ 2 -eq 2 ] && echo '1 -eq 2 || 2 -eq 2'

# ! negates an expression
[ ! -f "xyz" ] && echo 'xyz is not a file'

# case
S='bye'
case $S in
	hello)
		echo "case: hello"
		;;
	bye)
		echo "case: bye"
		;;
	*)
		echo "case: default"
		;;
esac

# case - default
S='123'
case $S in
	hello) echo "case: hello" ;;
	bye) echo "case: bye" ;;
	*) echo "case: default"; echo 'case: default - second echo' ;;
esac

# test command examples

# Numeric comparisons
[ 1 -eq 1 ] && echo '[ 1 -eq 1 ] is true' # checks if numbers are equal
[ 1 -ne 2 ] && echo '[ 1 -ne 2 ] is true' # checks if numbers are not equal
[ 1 -lt 2 ] && echo '[ 1 -lt 2 ] is true' # checks if the first number is less than the second
[ 1 -le 1 ] && echo '[ 1 -le 1 ] is true' # checks if the first number is less than or equal to the second
[ 2 -gt 1 ] && echo '[ 2 -gt 1 ] is true' # checks if the first number is greater than the second
[ 2 -ge 2 ] && echo '[ 2 -ge 2 ] is true' # checks if the first number is greater than or equal to the second

# String comparisons and length
[ 'hello' = 'hello' ] && echo "[ 'hello' = 'hello' ] is true" # checks if strings are equal
[ 'hello' != 'goodbye' ] && echo "[ 'hello' != 'goodbye' ] is true" # checks if strings are not equal
[ -z '' ] && echo "[ -z '' ] is true" # checks if a string has zero length
[ -n 'hello' ] && echo "[ -n 'hello' ] is true" # checks if a string has non-zero length

# File type, access, and size. $0 is the path used to invoke this script.
[ -e "$0" ] && echo '[ -e "$0" ] is true' # checks if a path exists
[ ! -e './file-that-does-not-exist' ] && echo "[ ! -e './file-that-does-not-exist' ] is true" # checks if a path does not exist
[ -f "$0" ] && echo '[ -f "$0" ] is true' # checks if a path is a regular file
[ -d '.' ] && echo "[ -d '.' ] is true" # checks if a path is a directory
[ -r "$0" ] && echo '[ -r "$0" ] is true' # checks if a path is readable
[ -w '.' ] && echo "[ -w '.' ] is true" # checks if a path is writable
[ -x '/bin/sh' ] && echo "[ -x '/bin/sh' ] is true" # checks if a path is executable
[ -s "$0" ] && echo '[ -s "$0" ] is true' # checks if a file has a size greater than zero

# File timestamp comparison
[ "$0" -nt '/etc/hosts' ] && echo '[ "$0" -nt "/etc/hosts" ] is true' || echo '[ "$0" -nt "/etc/hosts" ] is false' # checks if $0 is newer than /etc/hosts
