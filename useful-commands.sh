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

###########################
## Replace file contents ##
###########################
# sed = stream editor
# The sed pattern is
# 1. Loop through each line in the file
# 2. Run the sed script on that line, e.g. '3d' to delete if line 3
# 3. Print that line to stdout, unless excluded with -n

# s = substitute
sed 's/examples/testing/' test-dir/test.md            # replace examples with testing
sed 's/examples/testing/g' test-dir/test.md           # replace every occurrence on each line
sed -E 's/"my-dep": "[^"]+"/"my-dep": "2.0.0"/' test-dir/test.md # replace with an extended regex
# replace with a capturing group
# ("my-dep": ")   # capture group 1
# [^"]+           # match the current version
# \1              # put group 1 back
# 2.0.0           # replace the old version
sed -E 's/("my-dep": ")[^"]+/\12.0.0/' test-dir/test.md

# d = delete
sed '3d' test-dir/test.md                             # delete line 3
sed '2,4d' test-dir/test.md                           # delete line 2-4
sed '/line/d' test-dir/test.md                        # delete lines containing line
sed '/^$/d' test-dir/test.md                          # delete blank lines

# p = print
sed -n '3p' test-dir/test.md                          # print only line 3, -n stops the echo of each line as you go
sed -n '/line/p' test-dir/test.md                     # print only lines containing line (or use grep)
sed -n '3,5p' test-dir/test.md                        # print only lines 3-5
sed -n '/^#/p' test-dir/test.md                       # print lines beginning with #

# -i = inline replacements
sed -i '' 's/examples/testing/' test-dir/test.md      # do replacement inline
sed -i '.bak' 's/examples/testing/' test-dir/test.md  # do replacement inline with backup saved to test.md.bak
