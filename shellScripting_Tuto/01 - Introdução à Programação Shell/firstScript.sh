#!/bin/bash

# Esse é o nosso primeiro Script para ser interpretado em Bash, um famoso Shell para Linux.
# A primeira linha, escrita acima, "#!/bin/bash" trata-se de uma marcação para indicar que
# esse arquivo deve ser interpretado pelo próprio Bash. Para saber o caminho onde o Bash do
# seu computador se localiza, utilize o comando "whereis Bash" no seu Terminal.

clear
echo -e "Olá $USER!"
echo -e "Hoje é \c "; date
echo -e "Número do Login de Usuário: \c"; who | wc -l
echo -e "\nCalendário:"; cal
exit 0
