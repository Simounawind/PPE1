#!/usr/bin/env bash

#---TRAITEMENT---

fichier_urls=$1
linenum=1;
cible="种族歧视"
while read -r url || [[ -n $url ]];
do
	echo "fichier $linenum en cours de traitement."
	echo "
	<!DOCTYPE html>
	<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Concordances</title>
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
	" > concordance-$linenum.html
	grep -E -A3 -B3 "(\w+|\W+)+$cible(\W+|\w+)+" ../dumps-text/fich-$lineno.txt" > ./contexte/fich-$lineno.txt	
	echo "
	</tbody>
	</table>
	</body>
	</html>
	" >> concordance-$linenum.html
	linenum=$((linenum+1));
done < $fichier_urls
exit



#

