#!/usr/bin/env bash



#---TRAITEMENT---
echo "
<html>
		<head>
		<meta charset=\"UTF-8\" />
		<title>Tableaux</title>
		</head>
		<body>
			<table>
				<thead>
					<tr><th>Contexte droit</th><th>Mot</th><th>Contexte gauche</th>
					</tr>
				</thead>" >new.html
num=1
i=1
while ((i <= 53))
do
    dossier=urls-Xiaohua-$num.txt
    
    cible_avant=$(egrep -o "[^，。？！]+种族歧视 |sort " $dossier)
    while read before
    do
        echo "<tr><td>$before</td></tr>" >>new.html
    done < $cible_avant
    
    cible=$(egrep -o "种族歧视 |sort " $dossier)
    cible_apres=$(egrep -o "种族歧视.+[，。？！][^，。？！]+ |sort " $dossier)
    echo "<tr><td>$cible_avant</td><td><strong>$cible</strong></td><td>$cible_apres</td></tr>" >>new.html
    i=$((i+1));
    num=$((num+1))

done
echo "</table></body></html>" >> new.html
echo "Traitement terminé." >> new.html
exit

#Continuer à l'ex 4
