#!/usr/bin/zsh


dossier=$1
langue_abr=$2     # en, fr, ru, pl, it, jp, etc ......

echo "<lang=\"$langue_abr\">" > itrameur/dump-fich.txt
     # folder c'est dumptext    "itrameur/$contexte-$lang.txt" 

for filepath in$(ls $folder/$basename-*.txt)
do
    # filepath == dumps-text/fr-1.txt
    #  == > pagename =fr-1
    pagename="$(basename -s .txt $filepath)"

    echo "<page=\"$pagename\">"
    echo "<text>"

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
    echo "</page> $$$$$$$$$" >> "itrameur/$folder-$basename.txt"
done

echo "</lang>"