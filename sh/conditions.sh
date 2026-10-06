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