#!/bin/bash
    
# declaring the function 
greetings () {
    language=$1
    if [ $language == "en" ] 
    then
        echo "1"
        elif [ $language == "fr" ] 
        then
            echo "2"
        elif [ $language == "bn" ] 
        then
            echo "3"
    fi

}

# calling the function
echo $( greetings $1 )