##################
# Copy and paste #
##################
pbpaste                 # Write clipboard contents to stdout
echo 'hello' | pbcopy   # Read stdin and copy it to the clipboard

######################
## Find and replace ##
######################
# grep [OPTIONS] expression [PATH...]
# rg = rip grep
# rg [OPTIONS] pattern [PATH...]
# Note rg will exclude files in ignore files and hidden files by default.

##################
## Search files ##
##################
# Search in a file
grep testing README.md

# Search in all files recursively
grep -r testing .
rg testing
rg testing PATH
rg 'command testing'

# Search in all files in the current directory
rg --max-depth=1 string1
rg -d=1 string1

################
## Find files ##
################
# Find a file by name
find . -name my_file
# rg [OPTIONS] --files [PATH...]
# -g = --glob
rg --files -g '*.md' .

# Find a file excluding a directory
find . -path ./sh -prune -o -name '*.md' -print
rg --files -g '*.md' -g '!sh/**' .

# Find a file excluding multiple directories
find . \( -path './sh' -o -path './test-dir' \) -prune -o -name '*.md' -print
rg --files -g '*.md' -g '!sh/**' -g '!test-dir/**' .

###################
# Extract columns #
###################
# -F = delimiter
awk -F',' '{print $1}' test-dir/test.csv          # Column 1
awk -F',' '{print $1, $2}' test-dir/test.csv      # Column 1 and 2
# Skip header. NR > 1 = only run when record number > 1
awk -F',' 'NR > 1 {print $3}' test-dir/test.csv

 # Print the filename then filesize of .sh files in a dir.
ls -l | grep sh | awk '{print $9, "- file size:", $5, "bytes"}'
# With field padding. % = pad and right align value, %- = pad and left align value
ls -l | grep sh | awk '{printf "%-20s - file size: %5d bytes\n", $9, $5}'

########################
# Translate characters #
########################
# tr = translate, delete, or squeeze characters
echo 'hello' | tr '[:lower:]' '[:upper:]' # Convert lowercase to uppercase
echo 'hello   world' | tr -s ' '          # Squeeze repeated spaces
tr -d '\r' < file.txt                     # Delete carriage returns
