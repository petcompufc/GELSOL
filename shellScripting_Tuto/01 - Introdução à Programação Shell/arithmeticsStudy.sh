#!/bin/bash
#
# Defining and printing UDV's -> User Defined Variables
#
number=10
text='Tumbalacatumba Tumba Ta'
x=25
y=10
result='Resultado:'

echo -e $number
echo -e $text
echo -e $x
echo -e $y
echo -e $result

echo -e "Number: $number | x: $x | y: $y"

#
# Arithmetics operations using "expr" command
#
sum=`expr $x + $y`
subtract=`expr $x - $y`
multiplication=`expr $x \* $y`
division=`expr $x / $y`
module=`expr $x % $y`
number=`expr $number \* $number`

echo -e "\nSoma: $sum"
echo -e "Subtração: $subtract"
echo -e "Multiplicação: $multiplication"
echo -e "Divisão: $division"
echo -e "Resto: $module"
echo -e "$result $number"
