
import cv2

img = cv2.imread("your image path",0)
rect = cv2.getStructuringElement(shape=cv2.MORPH_RECT,ksize=(5,5))

erode = cv2.erode(img,kernel=rect,iterations=1)
dilate = cv2.dilate(img,kernel=rect,iterations=1)

boundary = img - erode
cv2.imshow('a',erode)
cv2.imshow('b',dilate)
cv2.imshow('c',boundary)

open = cv2.dilate(src=cv2.erode(img,kernel=rect,iterations=1), kernel=rect, iterations=1)
close = cv2.erode(src=cv2.dilate(img,kernel=rect,iterations=1), kernel=rect, iterations=1)
cv2.imshow('d',open)
cv2.imshow('e',close)
cv2.waitKey(0)