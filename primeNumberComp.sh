#!/bin/bash 

echo "Prime Number Computation"

function initialize () {
read -p " Enter range:" range
checkPrime $((range))
}

function checkPrime () {
range=$1
for (( i=700; i<=$(($1+1)); i++ ))
do
	flag=0
	for (( j=2; j<$i; j++ ))
	do
		if [ $(($i%$j)) -eq 0 ]
		then
			flag=1
		fi
	done
	if [ $flag -eq 0 ]
	then
		#echo $i
		array[$count]=$i
		((count++))
	fi
done
primesReverseOrder ${array[@]}
}

function primesReverseOrder () {
for (( i=${#array[@]}; i>=0; i-- ))
do
	echo "${array[i]}"

done
}
initialize

