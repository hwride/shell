#!/bin/sh

printf '%-53s # %s\n' 'Suffix removal : ${VAR%suffix_match}'                                      'Parameter expansion can use pattern matching to replace part of variables.'
echo 'Prefix removal : ${VAR#prefix_match}'
FILE='123-a-b/c/backup.md'
echo ''

printf '%-20s : %-30s # %s\n' '$FILE'              "$FILE"                        'The value of FILE'
printf '%-20s : %-30s # %s\n' '${FILE%up.md}'      "${FILE%up.md}"                'Removes matching suffix'
printf '%-20s : %-30s # %s\n' '${FILE%not}'        "${FILE%not}"                  'Does not match because the pattern is not a suffix'
printf '%-20s : %-30s # %s\n' '${FILE#123-*}'      "${FILE#123-*}"                'Removes matching prefix'
printf '%-20s : %-30s # %s\n' '${FILE%.*}'         "${FILE%.*}"                   'Matches anything after a .'
printf '%-20s : %-30s # %s\n' '${FILE%.*.*}'       "${FILE%.*.*}"                 'Matches anything after a . twice'
printf '%-20s : %-30s # %s\n' '${FILE%up.*}'       "${FILE%up.*}"                 'Matches up then a . then anything'
printf '%-20s : %-30s # %s\n' '${FILE%?}'          "${FILE%?}"                    '? matches 1 character'
printf '%-20s : %-30s # %s\n' '${FILE%??}'         "${FILE%??}"                   '? matches 2 characters'
printf '%-20s : %-30s # %s\n' '${FILE%m??}'        "${FILE%m??}"                  '? matches a single character exactly, so this does not match'
printf '%-20s : %-30s # %s\n' '${FILE%[abcd]}'     "${FILE%[abcd]}"               '? matches any character in the []'
printf '%-20s : %-30s # %s\n' '${FILE%[a-z]}'      "${FILE%[a-z]}"                'Character range, also works with numbers'
printf '%-20s : %-30s # %s\n' '${FILE%-*}'         "${FILE%-*}"                   'Single % removes the shortest matching suffix'
printf '%-20s : %-30s # %s\n' '${FILE%%-*}'        "${FILE%%-*}"                  'Double %% removes the longest matching suffix'
printf '%-20s : %-30s # %s\n' '${FILE#*/}'         "${FILE#*/}"                   'Single # removes the shortest matching prefix'
printf '%-20s : %-30s # %s\n' '${FILE##*/}'        "${FILE##*/}"                  'Double ## removes the longest matching prefix'

echo ''
echo '# Pattern matching can be used in case statements'
FILE='test.md'
case "$FILE" in *.md)
  echo "$FILE matches *.md"
  ;;
esac
echo ''

echo '# * matches any string, including an empty string.'
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

echo '# Pathname expansion turns an unquoted pattern into matching pathnames.'
echo '# The matches depend on the current directory when this script is run.'
echo 'echo *:'
echo *
echo ''

echo 'echo *.md:'
echo *.md
echo ''

echo '# find uses pattern matching, but pathname expansion is done by the shell.'
echo '# The quotes stop the shell from expanding *.md before find receives it.'
echo 'find . -name "*.md":'
find . -name '*.md'
echo ''

echo '# Bash extended [[ ]] also supports POSIX pattern notation, but is not POSIX sh.'
echo '# Run this example with bash, not sh:'
FILE='test.md'
[[ "$FILE" == *.md ]] && echo '[[ "$FILE" == *.md ]] is true'
echo ''
