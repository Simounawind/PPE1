#!/usr/bin/zsh


# ce script doit être lancé depuis la racine du projet
# cela lui permet de récupérer les fichiers dans lesbons dossiers.
# Se lancera donc comme ça : 
# $ ./programmes/correction_itrameur.sh


if  [[ $# -ne 2 ]]
then 
    echo "Deux arguments attendus: <dossier> <langue>"
    exit
fi

folder=$1    #dumptext dossier
basename=$2     # en, fr, ru, pl, it, jp, etc ......

echo "<lang=\"$basename\">" > "itrameur/$folder-$lang.txt"     # folder c'est dumptext    "itrameur/$contexte-$lang.txt" 

for filepath in $(ls $folder/$basename-*.txt)
do
    # filepath == dumps-text/fr-1.txt
    #  == > pagename =fr-1
    pagename="$(basename -s .txt $filepath)"

    echo "<page=\"$pagename\">" >> "itrameur/$folder-$basename.txt"
    echo "<text>" >> "itrameur/$folder-$basename.txt"

    #on récupère les dumps ou contextes
    # et on écrit à l'intérieur de la base text
    content = $(cat $filepath)
    # ordre important : & en premier
    # sinon : < => &lt ; => &amp;lt: 
    content=$(echo "$content" | sed 's/&/&amp;/g')
    content=$(echo "$content" | sed 's/</&lt;/g')
    content=$(echo "$content" | sed 's/>/&gt;/g')  #on fait deux groupes
    
    echo "$content" >> "itrameur/$folder-$basename.txt"

    echo "</text>" >> "itrameur/$folder-$basename.txt"
    echo "</page> §" >> "itrameur/$folder-$basename.txt"
    echo "</lang>" >> "itrameur/$folder-$basename.txt"
done
