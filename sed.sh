#######################
# sed = stream editor #
#######################

# sed [address[,address]]function[arguments] file

# The sed processing cycle is:
# 1. Read the next line from the file or stdin into the pattern space.
# 2. Process each sed function in the script in order.
# 3. For each function, check whether its address matches the current line.
# 4. If there is no address, or the address matches, run the function.
# 5. At the end, print the current line to stdout by default unless disabled by -n.

sed 's/line/REPLACED/' test-dir/test.md            # replace examples with testing

## addresses ##
sed '3s/line/REPLACED/' test-dir/test.md           # 3           = line number
sed '3,5s/line/REPLACED/' test-dir/test.md         # 3,5         = line number range
sed '3,/another/s/line/REPLACED/' test-dir/test.md # 3,/another/ = mixing line number and regex match
sed '$s/line/REPLACED/' test-dir/test.md           # $           = last line
sed '/another/s/line/REPLACED/' test-dir/test.md   # /regex/     = regex match
sed '/another/Is/line/REPLACED/' test-dir/test.md  # /regex/     = regex match case insensitive
sed 's/line/REPLACED/' test-dir/test.md            # no address = matches every pattern space

## functions ##
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
sed '/^[[:space:]]*$/d' test-dir/test.md              # delete lines with only whitespace

# p = print
sed -n '3p' test-dir/test.md                          # print only line 3, -n stops the echo of each line as you go
sed -n '/line/p' test-dir/test.md                     # print only lines containing line (or use grep)
sed -n '3,5p' test-dir/test.md                        # print only lines 3-5
sed -n '/^#/p' test-dir/test.md                       # print lines beginning with #

sed = test-dir/test.md                                # = means write the line number followed by newline

# -i = inline replacements
sed -i '' 's/examples/testing/' test-dir/test.md      # do replacement inline
sed -i '.bak' 's/examples/testing/' test-dir/test.md  # do replacement inline with backup saved to test.md.bak
