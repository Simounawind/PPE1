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
while ((i <= 52))
do
    dossier=fich-$i.txt
    echo "$dossier"
    
    egrep -o "[^，。？！]+种族歧视" $dossier | sort |
    # echo "$cible_avant" > transf.txt
    while read -r before
    do
        echo "<tr><td>$before</td></tr>" >> new.html
    done


    i=$((i+1));
done



# do
#     echo "<tr><td>$before</td></tr>" >>new.html
# done < $fichier_urls

cible=$(egrep -o "种族歧视 |sort " $dossier)
cible_apres=$(egrep -o "种族歧视.+[，。？！][^，。？！]+ |sort " $dossier)
echo "<tr><td>$cible_avant</td><td><strong>$cible</strong></td><td>$cible_apres</td></tr>" >>new.html
i=$((i+1));
num=$((num+1))
# done
echo "</table></body></html>" >> new.html
echo "Traitement terminé." >> new.html
exit