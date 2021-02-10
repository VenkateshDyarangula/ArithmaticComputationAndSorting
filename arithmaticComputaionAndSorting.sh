#!/bin/bash -x

#Declarartions
declare -A array
declare -A array2
kay=0
count=0
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
#UC8&UC9
showInOrder (){
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
    case $1 in
        -1) #prints in descending order
            for i in ${!tempArray[@]}
            do
                echo ${tempArray[$i]}
            done
            echo "Elements in Descending Oreder:" ${tempArray[@]}
            ;;
        1)  #prints in ascending order
            for((i=$((${#tempArray[@]}-1)); i>=0; i--))
            do
                 tempArray2[count++]=${tempArray[$i]}
            done
            echo "Elements in Ascending Order:" ${tempArray2[@]}
            ;;
        *)
            echo "Wrong Argument"
            ;;
    esac
    unset tempArray
    unset tempArray2
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
showInOrder -1
showInOrder 1

