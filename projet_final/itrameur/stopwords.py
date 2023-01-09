import jieba
with open('dumps.txt', encoding='UTF-8') as f1:
    document = f1.read()
    document_cut = jieba.cut(document)
    result = ' '.join(document_cut)
    print(result)
    with open('dumps-seg.txt', 'w') as f2:
        f2.write(result)
    f1.close()
    f2.close()


f3 = open('dumps.txt', encoding='UTF-8')
stopwords = {}.fromkeys([line.rstrip() for line in open(r'stopwords.txt', encoding='utf-8')])
for line in f3:
    segs = jieba.cut(line, cut_all=False)
    list = []
    for seg in segs:
        if seg not in stopwords:
            list.append(seg)
f3.close()

f4 = open('dumps_seg_clean.txt', 'w+', encoding='utf-8')
f4.write(' '.join(list))
f4.close()
