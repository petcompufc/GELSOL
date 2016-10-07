#!/bin/bash

#######################################################################
# Usando o comando "read" para receber dados do teclado (pelo Terminal)
#######################################################################

# Criamos uma variável
name=''			

echo -e "Qual seu nome?\nNome: \c"

# O comando "read" irá receber dados do terminal e enviará para o UDV nomeado "name"
read name 		

echo -e "\nOlá, $name!"

# Podemos, também, usar o comando para ler dados numéricos
echo -e "Digite um numero: \c"
read value	# Quando a variável não está definida, o próprio Bash trata de criá-la

echo -e "O quadrado de $value é `expr $value \* $value`."

#####################################################################
# Usando os operadores ">" ">>" e "<" para ler e escrever em arquivos
#####################################################################

# Vamos criar uma pasta "files" para não poluírmos nossa pasta original
mkdir -p files


# O operador ">" escreve dados num arquivo, mas apaga os dados anteriores
echo -e "Este dado não é concatenado" > files/noAppend.txt

# O operador ">>" escreve dados num arquivo, sempre uma linha abaixo do último dado escrito
echo -e "Este dado será repetido na linha abaixo" >> files/append.txt

# O operador "<" le dados de um arquivo. O dado lido é sempre linha-a-linha para cada comando
# "read". Existem outros comandos capazes de ler um arquivo inteiro, tais como o "cat"
read firstLine < files/append.txt

echo -e "\n1ª Linha de 'append.txt': '$firstLine'"

# Para imprimirmos o arquivo inteiro...
echo -e "\nTexto do Arquivo Inteiro:"
cat < files/append.txt