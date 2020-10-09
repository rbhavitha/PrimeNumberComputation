#!/bin/bash 

echo "Prime Number Computation"

function initialize () {
read -p " Enter range:" range
checkPrime $((range))
}

function checkPrime () {
range=$1
for (( i=2; i<=$(($1+1)); i++ ))
do
	flag=0
	for (( j=2; j<(($i/2)); j++ ))
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
find_Palindrome ${array[@]}
}
function find_Palindrome ( ){
for (( i=5; i<${#array[@]}; i++ ))
do
	number=${array[$i]}
	rev=0
	while [ $number -ne 0 ]
	do
        	rem=$(( $number%10 ))
        	rev=$(( ($rev*10)+$rem ))
        	number=$(( $number/10 ))
	done

	if [ $rev -eq ${array[i]} ]
	then
		echo $rev
		primePalindrome[$i]=$rev	
	fi
	done
echo "ARRAY OF primePalindromes:" ${primePalindrome[@]}
}

function primesReverseOrder () {
for (( i=${#array[@]}; i>=0; i-- ))
do
	echo "${array[i]}"

done
}
initialize

