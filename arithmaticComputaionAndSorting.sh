#!/bin/bash -x

#Declarartions
declare -A array
kay=0
echo "Welcome to ArithmaticComputaion"
takeInputs (){
read -p "Enter a Value:" a
read -p "Enter b Value:" b
read -p "Enter c Value:" c
echo "a b c Values are:" $a $b $c
}
#UC6
storeInDictionary (){
    Dictionary[$key]=$1
    ((key++))
}
#UC7
storeInArray (){
    for keys in ${!Dictionary[@]}
    do 
       array[$keys]=${Dictionary[$keys]} 
    done
}
#UC8
showInDescOrder (){
    tempArray=()
    for index in ${!array[@]}
    do
        tempArray[$index]=${array[$index]}
    done
    for((i=0; i<${#tempArray[@]}; i++))
    do
        index=$i
        max=${tempArray[$i]}
        for((j=$(($i+1)); j<$((${#tempArray[@]}-1)); j++))
        do
            if [ $max -lt ${tempArray[$j]} ]
            then
                max=${tempArray[$j]}
                index=$j
            fi
        done
        temp=${tempArray[$i]}
        tempArray[$i]=${tempArray[$index]}
        tempArray[$index]=$temp
    done
    for i in ${!tempArray[@]}
    do
        echo ${tempArray[$i]}
    done
    echo ${tempArray[@]}
    unset tempArray
}
#UC2
computeExp (){
    res1=$(($a+$b*$c))
    storeInDictionary $res1
    res2=$(($a*$b+$c)) #UC3
    storeInDictionary $res2
    if [ $b -eq 0 ]   #UC4
    then
      echo "Error:Divid by Zero"
    fi
    res3=$(($c+($a/$b)))
    storeInDictionary $res3
    res4=$(($a%$b+$c)) #UC5
    storeInDictionary $res4
    echo "$res1 $res2 $res3 $res4"
}
takeInputs
computeExp
echo "Values Stored in Dictionary" ${Dictionary[@]}
storeInArray
echo "Array Elements" ${array[@]}
showInDescOrder

