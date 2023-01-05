#!/usr/bin/env bash

#---TRAITEMENT---


fichier_text=$1
motif=$2



if [[ $# -ne 2 ]]
then
	echo "Ce programme demande exactement deux arguments."
	exit
fi

if [[ ! -f $fichier_text ]]
then
  echo "le fichier $fichier_text n'existe pas"
  exit
fi
  
echo "
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Contexte</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
  </head>
		<body>
			<table>
				<thead>
					<tr>
    				<th class=\"has-text-right\">Contexte droit</th>
   					<th>Cible</th>
    				<th class=\"has-text-left\">Contexte gauche</th>
  					</tr>
				</thead>
				<tbody>
" > sorti.html

grep -E -o "(\w+|\W+){0,10}$motif(\W+|\w+){0,10}" $fichier_text |sort|uniq | sed -E "s/(.*)($motif)(.*)/<tr><td>\1<\/td><td><strong>\2<\/strong><\/td><td>\3<\/td><\/tr>/" >> sorti.html



echo "
</tbody>
</table>
</body>
</html>
" >> sorti.html