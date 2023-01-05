import thulac
import errno
import fileinput
import os

# autre possibilité, lancer la commande:
# python -m thulac chinois.txt chinois_seg_output.txt -seg_only
# Mais ne permet pas les redirections d'entrées/sorties

seg = thulac.thulac(seg_only=True)
try:
    for line in fileinput.input():
        contenu = seg.cut(line, text=True)
        print(contenu)
        file = open('/Users/xiaohua/Desktop/Cours/PPE/PPE1/projet_final/itrameur/Dumps_aftertoken.txt','a+')
        file.write(contenu + '\n')
        file.close()
        
except IOError as e:
    if e.errno != errno.EPIPE:
        raise
