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
