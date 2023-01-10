import jieba
import matplotlib.pyplot as plt
from imageio import imread
from wordcloud import WordCloud, STOPWORDS, ImageColorGenerator
import numpy as np
from PIL import Image


text_from_file = open('dumps.txt', 'r', encoding='UTF-8')
data = text_from_file.read()
seg_list = jieba.cut(data, cut_all=False)
# open & read file for tokenization -> tokenize line by line

fW = open('dumps-ch_token.txt', 'w', encoding='UTF-8')
word_space = ' '.join(seg_list)
fW.write(word_space)
# put result in new file, separate tokens by space

text_from_file.close()
fW.close()

STOPWORDS = set((
    "En", "ch", "text", "ais", "svg", "Fran", "text", "page", "text page", "b", "v2",
    "他", "看", "就", "以及", "其", "吗", "进行", "是", "用", "也", "的",
    "年", "了", "日", "月", "年", "都", "有", "你", "和", "我", "但", "而", "中", "不", "上", "这", "在", "到", "为", "与", "说", "对", "但是", "从", "会", "还", "将", "很", "让 ", " 让", "或", "等", "要", "来", "就是", "一种", "时", "并", "她", "表示", "一些", "这个", "又", "后", "以为", "以", "让",
    "通过", "者", "不是", "分享", "比", "里", "去", "所以", "向", "那", "那么", "广告", "或者", "应该", "一定", "一", "则", "I", "and", "已", "己", "什么", "才", "过", "设计", "因", "着因",
    "of", "the", "文章", "to", "认为", "时候", "它", "其中", "着", "方面", "所有", "没有", "之后", "已经", "前", "给", "这是", "这样", "开始", "一样", "指出", "该", "地", "这些", "需要", "曾", "现在", "地方", "好", "由", "像", "这是", "给", "特别", "作为", "当", "甚至", "个", "下", "最后", "包括", "如果", "发生", "最", "还是", "可以", "把", "时间", "不能", "却", "成为", "继续", "跟", "对于", "高", "当"
    "其实", "们", "来自", "一个", "可能", "觉得", "这种", "比如", "因为", "相关", "因此", "看到", "只是", "有关", "最近", "一直", "万", "一名", "仍", "及", "再", "您", "多", "导致", "想", "所", "非常", "Espa", "不要", "无法", "情况", "地位", "ol", "为了", "如何", "其他", "那些", "虽然", "为什么", "为了", "有人", "这一", "出", "一位", "很多", "主要", "", "",
))

img = imread('poing.png')
img = np.array(Image.open('poing.png'))

my_wordcloud = WordCloud(
    scale=6,
    background_color='white',  # 设置背景颜色
    mask=img,  # 背景图片
    max_words=200,  # 设置最大显示的词数
    stopwords=STOPWORDS,  # 设置停用词
    # 设置字体格式，字体格式 .ttf文件需自己网上下载，最好将名字改为英文，中文名路径加载会出现问题。
    font_path='alima.ttf',
    max_font_size=150,  # 设置字体最大值
    random_state=50,  # 设置随机生成状态，即多少种配色方案
).generate(word_space)

image_colors = ImageColorGenerator(img)
my_wordcloud.recolor(color_func=image_colors)
plt.imshow(my_wordcloud)
plt.axis('off')
plt.show()
my_wordcloud.to_file('result.jpg')
