import jieba
# module for Chinese word segmentation

text_from_file = open('dumps.txt', 'r', encoding='utf-8')
data = text_from_file.read()
jieba.load_userdict("userdict.txt")
seg_list = jieba.cut(data, cut_all=False)

fW = open('corpus-ch_itrameur.txt', 'w', encoding='utf-8')
fW.write(' '.join(seg_list))
# put result in new file, separate tokens by space

text_from_file.close()
fW.close()

# trouver les stopwords et les remplacer avec space
mixed = open('corpus-ch_itrameur.txt', encoding='utf-8')
stopwords = {}.fromkeys([line.rstrip() for line in open(
    r'stop_words.txt', encoding='utf-8')])
for line in mixed:
    segs = jieba.cut(line, cut_all=False)
    list = []
    for seg in segs:
        if seg not in stopwords:
            list.append(seg)
mixed.close()

final = open('stop_words.txt', 'w+', encoding='utf-8')
final.write(' '.join(list))
final.close()
