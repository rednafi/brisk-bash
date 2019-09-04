#!/bin/bash

file_count () {
    ls -1 $1 | wc -l
}

# calling the function
echo $( file_count $1 )