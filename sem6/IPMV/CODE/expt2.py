import numpy as np
import cv2
from matplotlib import pyplot as pt

img = cv2.imread(""your image path"",0)

def histogram(gray):
    hist, bins = np.histogram(gray.flatten(), 256, [0, 256])
    cdf = np.cumsum(hist)
    cdf_normalized = cdf*(hist.max(initial=None)/cdf.max())
    return cdf_normalized

cdf= histogram(img)
equ = cv2.equalizeHist(img)
equ_cdf = histogram(equ)


pt.subplot(2,2,1)
pt.hist(img.flatten(), bins=256, range=[0, 256], color='r')
pt.plot(cdf,color='b')
pt.xlim(0, 256)
pt.legend(("cdf","Histogram"))
pt.title("Original histogram")

pt.subplot(2,2,2)
pt.hist(equ.flatten(), bins=256, range=[0, 256], color='r')
pt.plot(equ_cdf,color='b')
pt.xlim(0, 256)
pt.legend(("cdf","Histogram"))
pt.title("equilized histogram")

pt.subplot(2,2,3)
pt.imshow(img, cmap='gray')
pt.title("Original image")

pt.subplot(2,2,4)
pt.imshow(equ, cmap='gray')
pt.title("Equalised image")


pt.show()


