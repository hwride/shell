#!/bin/sh

# Parameter expansion can use pattern matching to replace part of variables.
# Suffix removal: ${VAR%suffix_match}
# Prefix removal: ${VAR#prefix_match}
FILE='notes.backup.md'
echo "\$FILE: $FILE"
echo "\${FILE%up.md}: ${FILE%up.md}" # Removes matching suffix
echo "\${FILE%not}: ${FILE%not}" # Does not match prefix
echo "\${FILE#not}: ${FILE#not}" # Removes matching prefix
echo "\${FILE%.*}: ${FILE%.*}" # Matching anything after a .
echo "\${FILE%.*.*}: ${FILE%.*.*}" # Matching anything after a . twice
echo "\${FILE%up.*}: ${FILE%up.*}" # Matches up then a . then anything
echo "\${FILE%?}: ${FILE%?}" # ? matching 1 character
echo "\${FILE%??}: ${FILE%??}" # matching two characters
echo "\${FILE%m??}: ${FILE%m??}" # ? matches a single character exactly so this won't match
echo "\${FILE%m??}: ${FILE%m??}" # ? matches a single character exactly so this won't match
echo "\${FILE%[abcd]}: ${FILE%[abcd]}" # matches any character in the []
echo "\${FILE%[a-z]}: ${FILE%[a-z]}" # character range, also works with numbers
echo ''

# Pattern matching can be used in case statements.
FILE='test.md'
case "$FILE" in *.md)
  echo "$FILE matches *.md"
  ;;
esac
echo ''


# * matches any string, including an empty string.
for FILE in notes.md notes.m README.txt .profile file1 file2
do
  case "$FILE" in
    *m) echo "$FILE matches *m" ;;
    notes*) echo "$FILE matches notes*" ;;
    README.tx?) echo "$FILE matches README.tx?" ;;
    file[0-9]) echo "$FILE matches file[0-9]" ;;
  esac
done
echo ''

# Pathname expansion turns an unquoted pattern into matching pathnames.
# The matches depend on the current directory when this script is run.
echo 'echo *:'
echo *
echo ''

echo 'echo *.md:'
echo *.md
echo ''

# find uses pattern matching, but pathname expansion is done by the shell.
# The quotes stop the shell from expanding *.md before find receives it.
echo 'find . -name "*.md":'
find . -name '*.md'
echo ''

# Bash extended [[ ]] also supports POSIX pattern notation, but is not POSIX sh.
# Run this example with bash, not sh:
FILE='test.md'
[[ "$FILE" == *.md ]] && echo '[[ "$FILE" == *.md ]] is true'
echo ''
