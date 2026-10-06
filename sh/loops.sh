#!/bin/sh

# For loop
# for name; do command; done
# for name in wordlist; do command; done
for i in 1 2 3 4 5
do
  echo "For i = $i"
done

# Here's a demo of how it's separator position that matters
for i in 1 2
do echo "Structure demo 1: $i"
done

for i in 1 2; do echo "Structure demo 2: $i"
done

for i in 1 2; do echo "Structure demo 3: $i"; done

# Note you can use any value in a for loop, even *sh for shell expansion
for i in 1 hello "this is quoted" *sh 5
do
  echo "For i = $i"
done

# Without an in clause for loops over script arguments.\
# Try running sh loops.sh a b c
echo 'for without in:'
for argument
do
  echo "Arg: $argument"
done

# While loop
# while condition; do command; done
X=1
while [ $X -lt 3 ]
do
  echo "[] X: $X"
  X=$((X + 1))
done

# demo that [ ] is actually just invoking the test utility and not part of shell command language
X=1
while test $X -lt 3
do
  echo "test X: $X"
  X=$((X + 1))
done

# While loop reading from CLI
while [ "$INPUT_STRING" != "end" ]
do
  echo "Type something (end to finish)"
  read INPUT_STRING
  echo "You said: $INPUT_STRING"
done

# while : means an infinite loop
while :
do
  echo "Please type something in (^C to quit)"
  read INPUT_STRING
  echo "You typed: $INPUT_STRING"
done