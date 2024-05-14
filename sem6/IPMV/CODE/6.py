import cv2
import numpy as np

img = cv2.imread('"your image path"', cv2.IMREAD_GRAYSCALE)

def thresh(img,thres=20,delta_thresh=1.0):

    #divide
    xl, yl = np.where(img <= thres)
    xh, yh = np.where(img > thres)

    #mean
    L = np.mean(img[xl,yl])
    H = np.mean(img[xh,yh])

    mean = (L+H)/2

    if abs(mean - thres) < delta_thresh:
        return mean
    else:
        return thresh(img,mean,delta_thresh)


th = thresh(img,150,1.0)
ret, t = cv2.threshold(img,th,255,cv2.THRESH_BINARY)
cv2.imshow('a',t)
cv2.waitKey(0)

