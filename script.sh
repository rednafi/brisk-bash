input_number=$1
for num in $(seq 0 $input_number)
do 
   if [ $num -lt $input_number ]
   then 
       echo $num
   fi
done
