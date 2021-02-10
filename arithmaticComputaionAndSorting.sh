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
    res2=$(($a*$b+$c))
    echo "$res1 $res2"
}
takeInputs
computeExp

