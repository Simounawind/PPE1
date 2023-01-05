#!/usr/bin/env bash

#---TRAITEMENT---

fichier_urls=$1
linenum=1;
cible="种族歧视"
while read -r || [[ -n ${url} ]] ;
do
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
	w3m -cookie $url | grep -E -o "(\w+|\W+){0,10}$cible(\W+|\w+){0,10}" |sort|uniq | sed -E "s/(.*)($cible)(.*)/<tr><td>\1<\/td><td><strong>\2<\/strong><\/td><td>\3<\/td><\/tr>/" >> concordance-$linenum.html
	linenum=$((linenum+1));
	echo "
	</tbody>
	</table>
	</body>
	</html>
	" >> concordance-$linenum.html
done < $fichier_urls
exit



#

