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
sort -n src/chapter-1/numbers.txt > src/chapter-1/sorted_numbers.txt
```

This command will perform the following tasks:

* Go to the `src/chapter-1` directory
* Sort the numbers in the `numbers.txt` files in ascending order
* Save the result in a new file called `sorted_numbers.txt` in the same directory

