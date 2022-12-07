#!/usr/bin/env bash



#---TRAITEMENT---
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

i=1
cible="种族歧视"
while ((i <= 52))
do
    dossier=fich-$i.txt
	echo "$dossier"
	egrep -o "(\w|\W){0,10}($cible)(\W|\w){0,10}" $dossier | sed -E "s/(.*)($cible)(.*)/<tr><td class=\"has-text-centered\">\1<\/td><td class=\"has-text-centered\"><strong>\2<\/strong><\/td><td <td class=\"has-text-centered\">\3<\/td><\/tr>/" >> sorti.html
    i=$((i+1));
done
exit

echo "
</tbody>
</table>
</body>
</html>
" >> sorti.html


#

