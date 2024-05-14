import cv2
import numpy as np
import matplotlib.pylab as plt


# Gaussian noise
img = cv2.imread('D:\\college related\\Third year\\sem6\\IPMV\\CODE\\flower.jpg',0)
cv2.imshow('image', img)
gaussian_noise = np.zeros((img.shape[0], img.shape[1]),dtype=np.uint8)
cv2.randn(gaussian_noise, 128, 20) #random noise
# cv2.imshow('gaussian_noise',gaussian_noise)
# cv2.waitKey(0)

# uniform noise
uniform_noise = np.zeros((img.shape[0], img.shape[1]),dtype=np.uint8)
cv2.randu(uniform_noise,0,255)  # uniform noise
# cv2.imshow('Uniform noise',uniform_noise)
# cv2.waitKey(0)

#impulse noise
ret,impulse_noise = cv2.threshold(uniform_noise,250,255,cv2.THRESH_BINARY)
# cv2.imshow('impulse_noise',impulse_noise)
# cv2.waitKey(0)

plt.subplot(2,3,1)
plt.imshow(gaussian_noise, cmap="gray")
plt.title("gaussian_noise")

plt.subplot(2,3,2)
plt.imshow(uniform_noise, cmap="gray")
plt.title("Uniform noise")

plt.subplot(2,3,3)
plt.imshow(impulse_noise, cmap="gray")
plt.title("impulse_noise")

'/////////////////////////////Adding of noise to image////////////////////////////////////////////'
gaussian_noise = (gaussian_noise*0.5).astype(np.uint8)
noisy_image1 = cv2.add(img,gaussian_noise)
# cv2.imshow('gaussian_noise',noisy_image1)
# cv2.waitKey(0)

noisy_image2 = cv2.add(img,uniform_noise)
# cv2.imshow('Uniform_noise',noisy_image2)
# cv2.waitKey(0)

impulse_noise = (impulse_noise).astype(np.uint8)
noisy_image3 = cv2.add(img,impulse_noise)
# cv2.imshow('noisy_image3',noisy_image3)
# cv2.waitKey(0)

plt.subplot(2,3,4)
plt.imshow(noisy_image1, cmap="gray")
plt.title("gaussian_noise")

plt.subplot(2,3,5)
plt.imshow(noisy_image2, cmap="gray")
plt.title("Uniform noise")

plt.subplot(2,3,6)
plt.imshow(noisy_image3, cmap="gray")
plt.title("impulse_noise")
plt.show()
plt.close()
'/////////////////////////////////////filtering///////////////////////////////'
blurred1 = cv2.medianBlur(noisy_image1, 3)
blurred2 = cv2.medianBlur(noisy_image2, 3)
blurred3 = cv2.medianBlur(noisy_image3, 3)

image_gaussian_processed1 = cv2.GaussianBlur(noisy_image1,(5,5),1)
image_gaussian_processed2 = cv2.GaussianBlur(noisy_image2,(5,5),1)
image_gaussian_processed3 = cv2.GaussianBlur(noisy_image3,(5,5),1)

plt.subplot(2,3,1)
plt.imshow(blurred1, cmap="gray")
plt.title("gaussian_noise/median")

plt.subplot(2,3,2)
plt.imshow(blurred2, cmap="gray")
plt.title("uniform_noise/median")

plt.subplot(2,3,3)
plt.imshow(blurred3, cmap="gray")
plt.title("impulse_noise/median")

plt.subplot(2,3,4)
plt.imshow(image_gaussian_processed1, cmap="gray")
plt.title("gaussian_noise/gaussian")

plt.subplot(2,3,5)
plt.imshow(image_gaussian_processed2, cmap="gray")
plt.title("uniform_noise/gaussian")

plt.subplot(2,3,6)
plt.imshow(image_gaussian_processed3, cmap="gray")
plt.title("impulse_noise/gaussian")
plt.show()



