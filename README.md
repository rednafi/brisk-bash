# Introduction 

## Shell

Several layers of events take place whenever a linux command is entered into the termimal. The top layer of that is known as *shell*.

`A shell is any
user interface to the UNIX operating system, i.e., any
program that takes input from the user, translates it into
instructions that the operating system can understand, and
conveys the operating system's output back to the user.`

Let's look at an example:

```
sort -n src/files/numbers.txt > src/files/sorted_numbers.txt
```

This command will perform the following tasks:

* Go to the `src/files` directory
* Sort the numbers in the `numbers.txt` files in ascending order
* Save the result in a new file called `sorted_numbers.txt` in the same directory

## History

The first major shell was the Bourne shell (named after its
inventor, Steven Bourne); it was included in the first
popular version of UNIX, Version 7, starting in 1979.
The Bourne shell is known on the system as `sh`. Although
UNIX has gone through many, many changes, the Bourne
shell is still popular and essentially unchanged. Several
UNIX utilities and administration features depend on it.

Variants of some popular shells:
* C Shell or `csh` (The syntax has resemblence with C programming language)
* Korn Shell or `ksh` (Similar to Bourne Shell with features from both Bourne and C Shell)
* The Bourne Again Shell or BASH (Started with the GNU project in 1988.)

BASH is going to be our primary focus here.

## A Few Basic Commands

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

`ls` lists all the files and folders in a user specified directory

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

### cat

`cat` shows the contents of a user specified file

```bash
# Display the contents of a file
cat /path/to/foo

# Display contents with line numbers
cat -n /path/to/foo

# Display contents with line numbers (blank lines excluded)
cat -b /path/to/foo
```

### cp

`cp` copies files or folders from one directory to another

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

`mv` moves files or folders from one directory to another and can also be used to rename files or folders

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

`grep` can be used to search through the output of another command

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

`lp` prints the specified output via an available printer

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

## Basic Scripting Examples

### Conditionals (if-else)

* This 
```bash

echo "Enter two numbers and intented operation:
* for addition, write add
* for subtraction, write sub
* for multiplication, write mul
* for division, write div

(write quit to quit the program)" 

num1=$1
num2=$2
operation=$3 

if [ $num1 == "quit" ]
then
    break

    elif [ $operation == "add" ]
    then 
        ans=$(( $num1 + $num2 ))
        echo "addition: $ans"

    elif [ $operation == "sub" ]
    then 
        ans=$(( $num1 - $num2 ))
        echo "subtraction: $ans"

    elif [ $operation == "mul" ]
    then 
        ans=$(( $num1 * $num2 ))
        echo "multiplication: $ans"

    elif [ $operation == "div" ]
    then 
        ans=$(( $num1 / $num2 ))
        echo "division: $ans"

fi
    ```

### for loop

* Looping through 0 to 9 with increment 3 and printing the numbers

    ```bash
    for var in {0..9..3}
    do
        echo $var
    done
    ```
    ```
    0
    3
    6
    9
    ```

  

* Looping through files in a folder and printing them one by one

    ```bash
    for file in $(ls src/files) 
    do
        echo $file
    done
    ```
    ```
    numbers.txt
    sorted_numbers.txt
    ```

* Summing numbers from 0 to 100 and printing the sum

    ```bash 
    sum=0
    for num in $(seq 0 100)
    do 
        sum=$(($sum+$num))
    done
    echo "Total sum is $sum"
    ``` 
    ```
    Total sum is 5050
    ```
* Taking a range from user and printing all the numbers upto it

    ```bash
    input_number=$1
    for num in $(seq 0 $input_number)
    do 
    if [ $num -lt $input_number ]
    then 
        echo $num
    fi
    done
    ```
    ```
    0
    1
    .
    .
    99
    ```
### while loop
* Calculate factorial of a given number
    ```bash
    counter=$1
    factorial=1
    while [ $counter -gt 0 ] 
    do
    factorial=$(( $factorial*$counter ))
    counter=$(( $counter - 1 ))
    done
    echo "Factorial of $1 is $factorial"
    ```
    ```
    Factorial of 5 is 120
    ```
* The break statement will skip the while loop when user enters `quit`, otherwise it will keep adding two numbers
  ```bash
    while :
    do
        read -p "Enter two numnbers ( - 1 to quit ) : " a b
        if [ $a -eq -1 ]
        then
            break
        fi
        ans=$(( a + b ))
        echo $ans
    done
    ```


## Practical Usage Examples
    