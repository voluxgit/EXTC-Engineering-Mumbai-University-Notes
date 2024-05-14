import cv2
from matplotlib import pyplot as plt
import numpy as np

img = cv2.imread("your image path",0) 

mask = np.ones([3, 3], dtype=int)
mask = mask/9

hmask = np.array([[-1,-1,-1],[-1,8,-1],[-1,-1,-1]])

plt.subplot(3,1,1)
plt.imshow(img, cmap='gray')

plt.subplot(3,1,2)
lpf = cv2.filter2D(src=img, ddepth = -1, kernel=mask)
plt.imshow(lpf, cmap='gray')

plt.subplot(3,1,3)
hpf = cv2.filter2D(src=img, ddepth = -1, kernel=hmask)
plt.imshow(hpf, cmap='gray')

plt.show()