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
## while loop
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
* 

    