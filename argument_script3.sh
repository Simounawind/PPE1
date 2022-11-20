#!/usr/bin/zsh
# 创建一个脚本来建立引用最多的地方的排名。
# 以年、月和要显示的位置数作为参数
# 接受 * 表示年份和月份


ANNEE=$1
MOIS=$2
N_LIEU=$3
echo "pour la date $ANNEE $MOIS les $N_LIEU lieux les plus cités sont : " > nlieu.txt
grep "Location" $ANNEE"_"$MOIS*.ann | sort -k 5 | uniq -c -f 5 | sort -r | head -n $N_LIEU | rev |cut -d' ' -f 1 |rev >> nlieu.txt