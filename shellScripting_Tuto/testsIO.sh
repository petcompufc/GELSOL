#!/bin/bash
#
# Using the command "read" to input values from keyboard
#
name=''

echo -e "What's your name?\nName: \c"
read name
echo -e "\nHello, $name!"

#
# Using the operands ">" ">>" and "<" to read and write in files
#
echo -e "Texto1; " > file1.txt
echo -e "Texto2; " >> file2.txt 

echo -e "Digit some text: \c"
read anyText
echo -e "$anyText; \c" >> names.txt


