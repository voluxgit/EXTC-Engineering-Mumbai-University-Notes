
import numpy as np       # library used for working with arrays
import matplotlib.pylab as plt  # library used for ploting,graph
import cv2

img = cv2.imread('your image path',0)
#img = cv2.cvtColor(img1, cv2.COLOR_BGR2GRAY)
# cv2.imshow("Input image",img)
# cv2.waitKey(0)
kernel = np.ones((5,5),np.uint8)
img_erosion1 = cv2.erode(img, kernel, iterations=1)
img_dilate1 = cv2.dilate(img, kernel, iterations=1)
img_boundary = img_dilate1-img
# cv2.imshow("Erosion", img_erosion1)
# cv2.waitKey(0)
# cv2.imshow("Dilation", img_dilate1)
# cv2.waitKey(0)
# cv2.imshow("Boundary", img_boundary)

kernel1=cv2.getStructuringElement(cv2.MORPH_RECT,(5,5))
kernel2 =cv2.getStructuringElement(cv2.MORPH_ELLIPSE,(5,5))
kernel3= cv2.getStructuringElement(cv2.MORPH_CROSS,(5,5))


img_erosion2 = cv2.erode(img, kernel1, iterations=1)
img_dilate2 = cv2.dilate(img, kernel2, iterations=1)


plt.subplot(1,2,1)
plt.imshow(img, cmap="gray")
plt.title("Input img")

plt.subplot(1,2,2)
plt.imshow(img_boundary, cmap="gray")
plt.title("Boundary")

plt.show()

plt.subplot(2,2,1)
plt.imshow(img_erosion1, cmap="gray")
plt.title("Erosion")

plt.subplot(2,2,2)
plt.imshow(img_erosion2, cmap="gray")
plt.title("Erosion")

plt.subplot(2,2,3)
plt.imshow(img_dilate1, cmap="gray")
plt.title("Dilation")

plt.subplot(2,2,4)
plt.imshow(img_dilate2, cmap="gray")
plt.title("Dilation")

plt.show()
