from flask import Flask
import cv2
import os
import numpy as np
import matplotlib.pyplot as plt
from os import listdir

app=Flask(__name__)

@app.route('/rgb')

for image in os.listdir():
    if(image,endswith("red.png")):
        img_path_red =  +"\\" + image

for image in os.listdir():
    if(image,endswith("green.png")):
        img_path_blue =  +"\\" + image

for image in os.listdir():
    if(image,endswith("blue.png")):
        img_path_green =  +"\\" + image0

for image in os.listdir():
    if(image,endswith("mapprojected.png")):
        img_path_mapprojected =  +"\\" + image
        
rgb_combine(img_path_red,img_path_blue,img_path_green)
def rgb_combine(img_path_red,img_path_blue,img_path_green):
    red = cv2.imread(img_path_red,0)
    green = cv2.imread(img_path_green,0)
    blue = cv2.imread(img_path_blue,0)
    merged = cv2.merge((red, green, blue))
    merged = cv2.cvtColor(merged, cv2.COLOR_BGR2RGB)
    directory =
    os.chdir(directory)
    cv2.imwrite(f"rgb.png",merged)
   



if __name__=='__main__':
    app.run()