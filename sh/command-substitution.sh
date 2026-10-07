#!/bin/sh

# You can use $() which will capture command stdout. This is the recommended way now.
echo '$():'
LS_RESULT=$(ls -l | grep command)
echo "$LS_RESULT"
echo ''

# You can use also backticks. These are more legacy.
LS_RESULT=`ls -l | grep command`
echo 'Backtick:'
echo "$LS_RESULT"
echo ''

# Nesting is easier with $() than `` as you must escape inner backticks.
echo 'Nesting:'
RESULT=$(printf '%s\n' "$(date)")
echo $RESULT
RESULT=`printf '%s\n' "\`date\`"`
echo $RESULT
