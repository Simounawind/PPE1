#/bin/bash

FICHIER=$1
URLS=$(cat $FICHIER)

echo $FICHIER
echo $URLS
#curl -I

for URL in $URLS
do
	curl -I $URL
done