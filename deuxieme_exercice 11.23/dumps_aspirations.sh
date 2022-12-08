#!/usr/bin/env bash

#===============================================================================
# VOUS DEVEZ MODIFIER CE BLOC DE COMMENTAIRES.
# Ici, on décrit le comportement du programme.
# Indiquez, entre autres, comment on lance le programme et quels sont
# les paramètres.
# La forme est indicative, sentez-vous libres d'en changer !
# Notamment pour quelque chose de plus léger, il n'y a pas de norme en bash.
#===============================================================================

fichier_urls=$1 # le fichier d'URL en entrée

lignenum=1;
fich=$(basename -s .txt $fichier_urls)
while read URL || [[ -n $URL ]];
do
	curl -o /Users/xiaohua/Desktop/Cours/PPE/PPE1/deuxieme_exercice\ 11.23/aspirations/fich-$lignenum.html $URL
	w3m $URL > /Users/xiaohua/Desktop/Cours/PPE/PPE1/deuxieme_exercice\ 11.23/dumps-text/fich-$lignenum.txt
	lignenum=$((lignenum+1));

done < $fichier_urls





