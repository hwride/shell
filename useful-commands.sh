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