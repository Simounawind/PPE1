1. Au début du semestre, je ne connaissais presque rien au contrôle de version Git, j'ai donc rencontré beaucoup de problèmes de conflits de versions, j'ai donc tout appris sur Git sur le site vidéo bilibili, y compris les quatre partitions, les commandes courantes git rest -hard, reflog, merge hot-fix, etc. Depuis lors, j'ai été en mesure de gérer git.
2. Je ne connais rien au shell et Bash, et je rencontre souvent des erreurs lors de l'exécution des programmes, ce qui réduit considérablement ma productivité. Il est donc nécessaire d'apprendre certaines des opérations de base et de comprendre son fonctionnement et ses règles. Après bien des difficultés, j'ai finalement donné un coup de jeune à mon terminal en utilisant `oh my zsh`, en installant git et le plugin de mise en évidence du code afin de pouvoir mieux visualiser les informations du projet.
3. Qu'est-ce que sed ? Que signifient les symboles `$`, `&` etc... ? Cela reste inconnu.
   Quels sont les paramètres du lynx ? Comment comprendre le code "lynx -dump -nolist -assume_charset=$charset -display_charset=$charset $URL" ?
   (toujours pas résolu)
4. Selon le script posté par le professeur, pourquoi le tableau généré a-t-il de multiples cas "utf-8" ? (je prédis que le problème est dans la ligne de `curl` )
   - problème résolu. Le professeur m'a dit que je devrais exclure des information du titre lorsque curl l'obtient.
5. Question pour l'établissement de pages Web : Comment comprendre le rôle du class `container` ? Comment créer des effets CSS plus riches ? Comment comprendre la logique de l'utilisation de CSS ?
6. Pourquoi les résultats de la recherche dans itrameur ne correspondent-ils pas à ce que je veux ? Certains mots à haute fréquence qui devraient apparaître sont maintenant disparus !
   - Problème résolu. Pour le chinois, il faut **segmenter** les mots. J'ai donc utilisé **jieba** pour diviser les mots et j'ai obtenu le résultat idéal.
7. Après avoir utilisé jieba pour segmenter les mots, certaines informations noyaux dans le fichier itrameur ne sont plus conservées, par exemple `<text>, <ch-page1>` deviennent maintenant ` < text > ,  < ch - page1 > `, même après avoir ajouté le dictionnaire utilisateur dict.txt, jieba les divisera toujours, pourquoi ?
8. Pourquoi le code html et bash ne s'affiche-t-il pas correctement dans highlight.js ?
   Problème résolu, en consultant d'autres personnes j'ai appris que pour les crochets pointus `<>` il faut remplacer par des caractères d'échappement. Par exemple : echo "&lt;/text&gt ;" &gt;&gt ; contexte.txt





## 11.27

### 1. 这是什么意思？如何学习lynx的指令？

dump=$(lynx -dump -nolist -assume_charset=$charset -display_charset=$charset $URL)



### 2. 根据老师发的script，为什么生成的tableau会出现这种情况？

（预测问题出现在curl指令的那行）

![image-20221127020734992](/Users/xiaohua/Documents/Markdown/assets/image-20221127020734992.png)