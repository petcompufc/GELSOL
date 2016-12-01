#/bin/bash
#########################################################################################################################################
#													QUEEN OF HEARTS - OCI VERSION														#
#########################################################################################################################################
#																																		#
#	* EXECUTANDO O SCRIPT: ($# = Número de Parâmetros)																					#
#																																		#
#	Se ( $# == 1 )																														#
#		$1 = Letra do Problema (O código-fonte deve estar no mesmo diretório que o script)												#
#		O código deve estar no mesmo diretório do script. 																				#
#																																		#
#	Se ( $# == 2 )																														#
#		$1 = Diretório do Aluno 																										#
#		#2 = Letra do Problema 																											#
#																																		#
#	Obs.:	Os arquivos de In/Out devem estar dentro da pasta "Problems/" que deve estar												#
#			no mesmo nível da pasta onde se encontra o Script. Dentro de "Problems/" devem												#
#			haver pastas para os arquivos In/Out de cada problema. Cada uma dessas pastas												#
#			devem possuir o mesmo nome do Problema.																						#
#																																		#
#########################################################################################################################################

clear
echo -e "### QUEEN OF HEARTS ###\nRESULTADOS DOS TESTES - $(date)" | tee testOutputs.txt

# Organização do Path dos Códigos
#################################
echo -e "\n--\nTESTE 1: PARAMETROS\n" | tee -a testOutputs.txt

case $# in
	1) 	path="."
		probLetter="$1" 
	 	;;
	2)	path="$1"
		probLetter="$2"
		;;
	*)	echo "ERRO 8: Muitos parâmetros!" | tee -a testOutputs.txt
		exit 8
		;;
esac

echo -e "\tpath = $path\n\tproblemLetter = $probLetter\n\tmaxTime = $(head -1 $probLetter/time)s (C/C++) | $(tail -1 $probLetter/time)s (Java)" | tee -a testOutputs.txt

# Primeira função: Teste de Compilação
######################################
echo -e "\n--\nTESTE 2: COMPILAÇÃO\n" | tee -a testOutputs.txt

mkdir $path/bin

# Identifica a Linguagem e realiza a compilação
extension=$(ls $path | grep "$probLetter")
extension=${extension##*.}

case $extension in
	"c") gcc "$path/$probLetter.c" -o "$path/bin/$probLetter.bin"
		 maxTime=$(head -1 $probLetter/time)
		;;
	"cpp") g++ "$path/$probLetter.cpp" -o "$path/bin/$probLetter.bin"
		 maxTime=$(head -1 $probLetter/time)
		;;
	"java") javac -d $path/bin $path/problemLetter.java
		 maxTime=$(tail -1 $probLetter/time)
		;;
esac

if [[ $? != 0 ]]; then
	echo "ERRO 2: Compilação falhou!" | tee -a testOutputs.txt
	rm -rf "$path/bin"; exit 2
fi

echo -e "\tCOMPILAÇÃO: OK" | tee -a testOutputs.txt
echo -e "\textension = .$extension" | tee -a testOutputs.txt
#####################################

# Segunda função: Teste de Execução
#####################################
echo -e "\n--\nTESTE 3: EXECUÇÃO\n" | tee -a testOutputs.txt

inTime=$(date +"%M%S")

if [[ $extension == "cpp" || $extension == "c" ]]; then
	judgeIN=$(./$path/bin/$probLetter.bin < "$probLetter/io/in")	 
else
	judgeIN=$(java $path/bin/probLetter < "$probLetter/io/in")	 
fi

outTime=$(date +"%M%S")

if [[ $? != 0 ]]; then
	echo "\tERRO 3: Execução falhou! (Teste No $i)" | tee -a testOutputs.txt
	rm -rf "$path/bin"; exit 3
fi

interval=$((outTime - inTime))

echo $inTime
echo $outTime
echo $interval

if [[ $interval -ge $maxTime ]]; then
 	echo -e "\tERRO 4: Tempo máximo ultrapassado! (Teste No $i)\n\tTempo Máximo: $maxTime | Tempo Obtido: $interval" | tee -a testOutputs.txt
	rm -rf "$path/bin"; exit 4
fi 

judgeOUT=$(< "$probLetter/io/sol")

if [[ $judgeIN != $judgeOUT ]]; then
 	echo -e "\tERRO 5: Resposta incorreta! (Teste No $i)\n" | tee -a testOutputs.txt
	rm -rf "$path/bin"; exit 5
fi	

# Prompt de Finalização
#####################################
echo -e "\tEXECUÇÃO: OK" | tee -a testOutputs.txt
echo -e "\tTEMPO LIMITE: OK" | tee -a testOutputs.txt
echo -e "\tRESPOSTA: OK" | tee -a testOutputs.txt

echo -e "\nPASSOU NO TESTE :)\n" | tee -a testOutputs.txt

rm -rf "$path/bin"
#####################################
