#!/usr/bin/zsh
# 复制第一个脚本
# 修改它，使年份和实体类型作为程序参数给出。
# 修改第一个脚本以调用第二个脚本以产生相同的结果。
ANNEE=$1
MOIS=$2
JOUR=$3
TYPE_ENTITE=$4

echo "Nombre de $TYPE_ENTITE pour $ANNEE"_"$MOIS"_"$JOUR est :" > exercice1.txt
grep "$TYPE_ENTITE" $ANNEE"_"$MOIS"_"$JOUR*.ann |wc -l >> exercice1.txt

#此时输入除了有sh. xxxx.sh外，还应加上$1-4的变量
#  ~/De/C/PP/s/seance2/e/Fichiers sh variable_script.sh 2017 01 21 Organization