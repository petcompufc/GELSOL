#!/bin/bash

#######################################################
# Definindo e imprimindo UDV's (User Defined Variables)
#######################################################
x=25
y=10
text='Cachorros sao melhores que gatos'
result='Resultado:'

# Note que realizamos o acesso das variáveis usando o operador "$"
echo -e $number
echo -e $text
echo -e $x
echo -e $y
echo -e $result

# É possível, também, concatenar texto com a impressão das variáveis
echo -e "number: $number | x: $x | y: $y"

####################################################
# Expressões aritméticas utilizando o comando "expr"
####################################################
# IMPORTANTE: lembre-se de, sempre que usar o comando "expr", colocá-lo
# entre duas crases ( `expr` ). Dessa forma, o Bash irá entender que esse
# é um comando escrito dentro dos outros comandos da mesma linha.

soma=`expr $x + $y`
subtracao=`expr $x - $y`
multiplicacao=`expr $x \* $y` 		# O operador deve ser escrito como "\*", já que o "*" é um "coringa" (você entenderá em breve) 
divisao=`expr $x / $y`				# A divisão que o Bash executa é uma divisão-por-inteiro, e o resultado é inteiro!
resto=`expr $x % $y`

number=`expr $number \* $number` 	# Exemplo de operação com retorno direto num operando

echo -e "\nSoma: $sum"
echo -e "Subtração: $subtract"
echo -e "Multiplicação: $multiplication"
echo -e "Divisão: $division"
echo -e "Resto: $module"

echo -e "$result $number"

# Retorno
exit 0