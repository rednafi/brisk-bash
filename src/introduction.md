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
* The Bourne Again Shell or BASH (Started with the GNU project in 1988)

BASH is going to be our primary focus here.

