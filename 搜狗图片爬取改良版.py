import requests
import json
import time
import os
import argparse

print('''
                     图片可下载的类型
=================================================
|       动物 明星 影视 汽车 动漫 摄影 游戏         |
|       体育 军事 萌宠 静物 卡通 清新 优质         |
|       日历 手绘 炫彩 唯美 可爱 创意 美女         |
=================================================
''')

parser = argparse.ArgumentParser()   
parser.add_argument('-t','--type', type=str,metavar='', help='type of image downloaded')  
parser.add_argument('-n','--number', type=int,metavar='', help='number of images downloaded')  
args = parser.parse_args()

def getSogouImag(category,genre,length,path):
    n = length
    cate = category
    imgs = requests.get('http://pic.sogou.com/pics/channel/getAllRecomPicByTag.jsp?category='+cate+'&tag='+genre+'&start=0&len='+str(n)+'&width=1440&height=900')
    jd = json.loads(imgs.text)
    jd = jd['all_items']
    imgs_url = []
    for j in jd:
        imgs_url.append(j['pic_url'])
    m = 1
    for line in imgs_url:
        time.sleep(1)
        print('***** '+str(m)+'.jpg *****'+'   Downloading...')
        if not os.path.isdir(path):
            os.makedirs(path)
        else:
            pass
        r = requests.get(line)
        with open(path+genre+str(m)+".jpg", 'wb') as f:
            f.write(r.content)
            f.close()
        m = m + 1
    print('Download complete!')



if __name__ == '__main__':
    try:
        getSogouImag('壁纸',args.type,args.number,"D://搜狗电脑壁纸//")
    except TypeError:
        print('No parameter options！！！\nYou can view help information through the -h option')


