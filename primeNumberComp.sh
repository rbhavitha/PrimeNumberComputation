#!/bin/bash 

echo "Prime Number Computation"

function initialize () {
read -p " Enter range:" range
checkPrime $((range))
}

function checkPrime () {
count=1
i=2
range=$1
while [ $count -le $range ]
do
	flag=0
	for (( j=2; j<=$(($i/2)); j++ ))
	do
		if [ $(($i%$j)) -eq 0 ]
		then
			flag=1
			break
		fi
	done
	if [ $flag -eq 0 ]
	then
		#echo $i
		array[count]=$i
		((count++))
	fi
	((i++))
done
primesReverseOrder ${array[@]}
}

function primesReverseOrder () {
for (( i=${#array[@]}; i>=0; i-- ))
do
	echo "${array[i]}"
	((i--))

done
}
initialize

