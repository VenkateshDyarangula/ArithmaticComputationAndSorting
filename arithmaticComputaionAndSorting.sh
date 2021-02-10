#!/bin/bash -x
echo "Welcome to ArithmaticComputaion"
takeInputs (){
read -p "Enter a Value:" a
read -p "Enter b Value:" b
read -p "Enter c Value:" c
echo "a b c Values are:" $a $b $c
}
#UC2
computeExp (){
    res1=$(($a+$b*$c))
    res2=$(($a*$b+$c)) #UC3
    if [ $b -eq 0 ]   #UC4
    then
      echo "Error:Divid by Zero"
    fi
    res3=$(($c+($a/$b)))
    res4=$(($a%$b+$c)) #UC5
    echo "$res1 $res2 $res3 $res4"
}
takeInputs
computeExp

