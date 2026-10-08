#!/bin/sh

# Attempt at https://www.shellscript.sh/exercises.html#addressbook
ADDRESS_FILE=address-book.txt

display() {
  cat "$ADDRESS_FILE"
  echo ''
}

search() {
  printf '%s' 'Enter search pattern: '
  read SEARCH_PATTERN
  grep "$SEARCH_PATTERN" "$ADDRESS_FILE"
  echo ''
}

add() {
  echo 'Enter address (Name, Surname, Email, Phone):'
  read NEW_ADDRESS
  echo "$NEW_ADDRESS" >> "$ADDRESS_FILE"
  echo ''
}

remove() {
  printf '%s' 'Enter delete pattern: '
  read DELETE_PATTERN
  grep -v "$DELETE_PATTERN" "$ADDRESS_FILE" > "$ADDRESS_FILE.tmp"
  mv "$ADDRESS_FILE.tmp" "$ADDRESS_FILE"
  echo ''
}

reset_data() {
  printf '%s\n' 'a,b,s,123
hugo,test,a@a.com,1234
john,j,asdfds,23423' > "$ADDRESS_FILE"
}

# init address book
if [ ! -f "$ADDRESS_FILE" ]; then
  echo "Creating address book $ADDRESS_FILE"
  touch "$ADDRESS_FILE"
else
  echo "Address book already exists"
fi

while :
do
  printf "%s" "Choose a function: display (d), search(s), add(a), remove (r), reset data (x), quit (q): "
  read INPUT_STRING
  case "$INPUT_STRING" in
    display)
      display
      ;;
    d)
      display
      ;;
    search)
      search
      ;;
    s)
      search
      ;;
    add)
      add
      ;;
    a)
      add
      ;;
    remove)
      remove
      ;;
    r)
      remove
      ;;
    reset)
      reset_data
      ;;
    x)
      reset_data
      ;;
    quit)
      break
      ;;
    q)
      break
      ;;
    *)
      echo 'Unrecognised command'
      ;;
  esac
done