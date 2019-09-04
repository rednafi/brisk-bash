#!/bin/bash

file=$1

while read -r line
do
    echo $line
done < "$file"