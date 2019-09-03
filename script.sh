#!/bin/bash

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