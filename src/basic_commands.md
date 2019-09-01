# A Few Basic Commands

List of most frequently used commands:

- `ls`
- `cat`
- `cp`
- `mv`
- `rm`
- `grep`
- `lp`

All of the following command summary can be found via 
```bash
curl cheat.sh/<prompt>
```

### ls
```bash
# Displays everything in the target directory
ls path/to/the/target/directory

# Displays everything including hidden files
ls -a

# Displays all files, along with the size (with unit suffixes) and timestamp
ls -lh

# Display files, sorted by size
ls -S

# Display directories only
ls -d */

# Display directories only, include hidden
ls -d .*/ */
```

## cat
```bash
# Display the contents of a file
cat /path/to/foo

# Display contents with line numbers
cat -n /path/to/foo

# Display contents with line numbers (blank lines excluded)
cat -b /path/to/foo
```

### cp
```bash
# Create a copy of a file
cp ~/Desktop/foo.txt ~/Downloads/foo.txt

# Create a copy of a directory
cp -r ~/Desktop/cruise_pics/ ~/Pictures/

# Create a copy but ask to overwrite if the destination file already exists
cp -i ~/Desktop/foo.txt ~/Documents/foo.txt

# Create a backup file with date
cp foo.txt{,."$(date +%Y%m%d-%H%M%S)"}
```

### mv
```bash
# Move a file from one place to another
mv ~/Desktop/foo.txt ~/Documents/foo.txt

# Move a file from one place to another and automatically overwrite if the destination file exists
# (This will override any previous -i or -n args)
mv -f ~/Desktop/foo.txt ~/Documents/foo.txt

# Move a file from one place to another but ask before overwriting an existing file
# (This will override any previous -f or -n args)
mv -i ~/Desktop/foo.txt ~/Documents/foo.txt

# Move a file from one place to another but never overwrite anything
# (This will override any previous -f or -i args)
mv -n ~/Desktop/foo.txt ~/Documents/foo.txt

# Move listed files to a directory
mv -t ~/Desktop/ file1 file2 file3
```

### grep
```bash
# Search a file for a pattern
grep pattern file

# Case insensitive search (with line numbers)
grep -in pattern file

# Recursively grep for string <pattern> in folder:
grep -R pattern folder

# Read search patterns from a file (one per line)
grep -f pattern_file file

# Find lines NOT containing pattern
grep -v pattern file

# You can grep with regular expressions
grep "^00" file  #Match lines starting with 00
grep -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" file  #Find IP add

# Find all files which match {pattern} in {directory}
# This will show: "file:line my research"
grep -rnw 'directory' -e "pattern"

# Exclude grep from your grepped output of ps.
# Add [] to the first letter. Ex: sshd -> [s]shd
ps aux | grep '[h]ttpd'

# Colour in red {bash} and keep all other lines
ps aux | grep -E --color 'bash|$'
```

### lp
```bash
# lp
# Print files.

# Print the output of a command to the default printer (see `lpstat` command):
echo "test" | lp

# Print a file to the default printer:
lp path/to/filename

# Print a file to a named printer (see `lpstat` command):
lp -d printer_name path/to/filename

# Print N copies of file to default printer (replace N with desired number of copies):
lp -n N path/to/filename

# Print only certain pages to the default printer (print pages 1, 3-5, and 16):
lp -P 1,3-5,16 path/to/filename

# Resume printing a job:
lp -i job_id -H resume
```
