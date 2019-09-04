## Table of Contents
<!-- TOC --> 
- [Introduction](#introduction)
- [Shell](#shell)
- [History](#history)
- [A Few Basic Commands](#a-few-basic-commands)
    - [cd](#cd)
    - [ls](#ls)
    - [cat](#cat)
    - [cp](#cp)
    - [mv](#mv)
    - [mkdir](#mkdir)
    - [rm](#rm)
    - [grep](#grep)
    - [lp](#lp)
    - [clear](#clear)
    - [exit](#exit)
- [Basic Scripting Examples](#basic-scripting-examples)    
    - [Running a Shell Script](#running-a-shell-script)    
        - [conditionals (if-else)](#conditionals-if-else)
        - [for loop](#for-loop)
        - [while loop](#while-loop)
<!-- /TOC -->

## Introduction

## Shell

Several layers of events take place whenever a linux command is entered into the termimal. The top layer of that is known as _shell_.

`A shell is any user interface to the UNIX operating system, i.e., any program that takes input from the user, translates it into instructions that the operating system can understand, and conveys the operating system's output back to the user.`

Let's look at an example:

```
sort -n src/files/numbers.txt > src/files/sorted_numbers.txt
```

This command will perform the following tasks:

- Go to the `src/files` directory
- Sort the numbers in the `numbers.txt` files in ascending order
- Save the result in a new file called `sorted_numbers.txt` in the same directory

## History

The first major shell was the Bourne shell (named after its inventor, Steven Bourne); it was included in the first popular version of UNIX, Version 7, starting in 1979. The Bourne shell is known on the system as `sh`. Although UNIX has gone through many, many changes, the Bourne shell is still popular and essentially unchanged. Several UNIX utilities and administration features depend on it.

Variants of some popular shells:

- C Shell or `csh` (The syntax has resemblence with C programming language)
- Korn Shell or `ksh` (Similar to Bourne Shell with features from both Bourne and C Shell)
- The Bourne Again Shell or BASH (Started with the GNU project in 1988.)

BASH is going to be our primary focus here.

## A Few Basic Commands

List of most frequently used commands. All of these commands can be run directly from a bash command prompt:

- `cd`
- `ls`
- `cat`
- `cp`
- `mv`
- `mkdir`
- `rm`
- `grep`
- `lp`

All of the following command summary can be found via:

```bash
curl cheat.sh/<prompt>
```
### cd 

```bash
#Go to the given directory
cd path/to/directory

#Go to home directory of current user
cd

#Go up to the parent of the current directory
cd ..

#Go to the previously chosen directory
cd -
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

### mkdir

`mkdir` is used to create folder in a directory
```bash
# Create a directory and all its parents
mkdir -p foo/bar/baz

# Create foo/bar and foo/baz directories
mkdir -p foo/{bar,baz}

# Create the foo/bar, foo/baz, foo/baz/zip and foo/baz/zap directories
mkdir -p foo/{bar,baz/{zip,zap}}
```

### rm

`rm` is mainly used to delete files or folders

```bash
# Remove files and subdirs
rm -rf path/to/the/target/

# Ignore non existent files
rm -f path/to/the/target

# Remove a file with his inode
find /tmp/ -inum 6666 -exec rm -i '{}' \;
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

### clear

`clear` is used to clear the CLI window

```bash
# clear
# Clears the screen of the terminal.

# Clear the screen (equivalent to typing Control-L when using the bash shell):
clear
```

### exit

`exit` closes the CLI window

```bash
# exit
# Quit the current CMD instance or the current batch file.
# More information: <https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/exit>.

# Quit the current CMD instance:
exit

# Quit the current batch script:
exit /b

# Quit using a specific exit code:
exit exit_code
```

## Basic Scripting Examples

### Running a Shell Script

* Create a file with `.sh` extension. I have used Ubunutu's built in `nano` editor for that.

    ```
    $ nano script.sh
    ```
* Put your code in the `.sh` file
* Make sure you put shebang `#!/bin/bash` at the beginning of each script, otherwise, the system wouldn't know which interpreter to use.

* Give permission to run:

    ```
    $ chmod +x script.sh
    ```
* Run the script via:

    ```
    $ ./script
    ```
* If the script takes in one or multiple arguments, then place those with spaces in between.

    ```
    $ ./script arg1 arg2
    ```


### conditionals (if-else)

* This program,
    - Takes in two integers as arguments
    - Compares if one number is greater than the other or if they are equal
    - Returns the greater of the two numbers or if they are equal, returns equal

    ```bash
    #!/bin/bash

    number1=$1
    number2=$2
    if [ $number1 -eq $number2 ]
    then
        echo "The numbers are equal"

    elif [ $number1 -gt $number2 ]
    then
        echo "The greater number is $number1"

    elif [ $number2 -gt $number1 ]
    then
        echo "The greater number is $number2"
    fi
    ```
    ```
    $ ./script.sh 12 13
    The greater number is 13
    ```

* This program,
    - Takes a single number as an argument
    - Checks whether the number is Odd or Even
    - Returns Odd or Even accordingly

    ```bash
    #!/bin/bash

    number=$1
    if [ $((number%2)) -eq 0 ]
    then 
        echo "Even"
    else 
        echo "Odd"
    fi
    ```
    ```
    $ ./script.sh 20
    Even
    ```

* This program,
    - Takes in two integers and an operation instruction 
    - Returns the value according to the operation


    ```bash
    #!/bin/bash

    echo "Enter two numbers and the intented operation:
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
    ```
    $ ./script.sh 12 13 add
    25
    ```

### for loop

* Looping through 0 to 9 with increment 3 and printing the numbers

    ```bash
    #!/bin/bash

    for var in {0..9..3}
    do
        echo $var
    done
    ```

    ```
    $ ./script.sh
    0
    3
    6
    9
    ```

* Looping through files in a folder and printing them one by one

    ```bash
    #!/bin/bash

    for file in $(ls ./files) 
    do
        echo $file
    done
    ```

    ```
    $ ./script.sh
    numbers.txt
    sorted_numbers.txt
    ```

* This program, 
    - Doesn't take any argument
    - Returns the summation of all the integers, starting from 0, upto 100

    ```bash
    #!/bin/bash

    sum=0
    for num in $(seq 0 100)
    do 
        sum=$(($sum + $num))
    done
    echo "Total sum is $sum"
    ```

    ```
    $ ./script.sh
    Total sum is 5050
    ```

* This program,
    - Takes in an integer as argument
    - Prints all the numbers upto that number, starting from 0

    ```bash
    #!/bin/bash

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
    $ ./script.sh 100
    0
    1
    .
    .
    99
    ```

  ### while loop

* This program, 
    - Takes in a single integer as argument
    - Returns the factorial of that number

    ```bash
    #!/bin/bash

    counter=$1
    factorial=1
    while [ $counter -gt 0 ] 
    do
    factorial=$(( $factorial * $counter ))
    counter=$(( $counter - 1 ))
    done
    echo "Factorial of $1 is $factorial"
    ```

    ```
    $ ./script.sh 5
    Factorial of 5 is 120
    ```

*   This program,
    - Takes two integers as arguments
    - Returns the summation of the numbers
    - Sending `-1` as an input quits the program

    ```bash
    #!/bin/bash

    while :
    do
        read -p "Enter two numbers ( - 1 to quit ) : " a b
        if [ $a -eq -1 ]
        then
            break
        fi
        ans=$(( a + b ))
        echo $ans
    done
    ```

    ```
    $ ./script.sh  10 20
    30
    ```
*   This program,
    - Takes in a text filepath as argument
    - Reads and prints out each line of the file

    ```bash 
    #!/bin/bash

    file=$1

    while read -r line
    do
        echo $line
    done < "$file"
    ```
    ```
    $ ./script.sh files/numbers.txt
    5
    55
    .
    .
    11
    10
    ```

  ### functions

    Functions are incredible tools when we need to reuse code. Creating functions are fairly straight 
    forward in bash.

*   This function,

    - Takes a directory as an input argument
    - Counts the number of files in that directory and prints that out
    - Note that this function ignores the dot files (The `ls -1` flag ignores dot files)


    ```bash
    #!/bin/bash

    # declaring the function
    file_count () {
        ls -1 $1 | wc -l
    }

    # calling the function
    echo $( file_count $1 )
    ```
    ```
    $ ./script.sh ./files
    $ 2
    ```

*   This function,
    - Takes in a short code for any of the following languages
      (a) `en` for English
      (b) `fr` for French
      (c) `bn` for bangla

    - Returns a welcome message in the selected language


    ```bash
    #!/bin/bash
    
    # declaring the function
    greetings () {
        language=$1
        if [ $language == "en" ]
        then
            echo "Greetings Mortals!"
            elif [ $language == "fr" ]
            then
                echo "Salutations Mortels!"
            elif [ $language == "bn" ]
            then
                echo "নশ্বরকে শুভেচ্ছা!"
        fi

    }

    # calling the function
    echo $( greetings $1 )
    ```
    ```
    $ ./script.sh en
    Greetings Mortals!
    ```

*   This function,
    - Takes a directory as an argument
    - Loop through the files
    - Only returns the text files with full path


    ```bash
    #!/bin/bash

    # declaring the function
    return_text () {
    dir=$1
    for file in $dir"/*.txt"
    do
        echo "$( realpath $file )"
    done

    }

    echo "$( return_text $1 )"
    ```
    ```
    $ ./script.sh
    /home/redowan/code/bash/files/numbers.txt
    /home/redowan/code/bash/files/sorted_numbers.txt
    ```

## Sources 
Here are some awesome sources where you can always look into if you get stuck
    - [Command Line Crash Course](https://learnpythonthehardway.org/book/appendixa.html) 
    - [Ryans Bash Tutorial](https://ryanstutorials.net/bash-scripting-tutorial/)
    - [W3 School CLI Tutorial](https://www.w3schools.com/whatis/whatis_cli.asp) 

