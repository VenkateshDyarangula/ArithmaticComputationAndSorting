#!/bin/bash -x

#Declarartions
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
