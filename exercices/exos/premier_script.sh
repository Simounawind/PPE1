#!/usr/bin/zsh
#Ce script sert à donner le nombre de location par année

echo "Nombre de Location pour 2016 est :" > sortie.txt
grep "Location" 2016*.ann |wc -l >> sortie.txt
echo "Nombre de Location pour 2017 est :" >> sortie.txt
grep "Location" 2017*.ann |wc -l >> sortie.txt
echo "Nombre de Location pour 2018 est :" >> sortie.txt
grep "Location" 2018*.ann |wc -l >> sortie.txt