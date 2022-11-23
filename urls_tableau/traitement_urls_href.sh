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
fichier_tableau=$2 # le fichier HTML en sortie

# !!!!!!
# ici on doit vérifier que nos deux paramètres existent, sinon on ferme!
# !!!!!!

# modifier la ligne suivante pour créer effectivement du HTML
linenum=1;

while read -r line;
do
	echo "
	<html>
		<head>
			<title> Try it</title>
		</head>

		<body>
			<p>"ligne $linenum:"</p>
			<p>$line</p>
			<a href="\"$line\"">Click here</a>
		</body>
	</html>
	" >> $fichier_tableau;
	linenum=$((linenum+1));
done < $fichier_urls