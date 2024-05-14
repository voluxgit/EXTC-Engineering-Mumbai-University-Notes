close all;
clear;
clc;

img = imread("D:\college related\Third year\sem6\IPMV\CODE\cameraman.png");
I = rgb2gray(img);
I = double(I);
[r c] = size(I);
I = fft2(I);
Is = fftshift(I);


D0 = 50;
n = 5;
Hi = zeros(r,c);
Hb = zeros(r,c);
Hg = zeros(r,c);

for i = 1:r
    for j = 1:c
        D = sqrt(((i-(r/2))^2) + ((j-(c/2))^2));
        //////////////ideal//////////////// 
        if D <= D0 then
            Hi(i,j) = 1;
        else
            Hi(i,j) = 0;
        end
        //////////////////butterworth//////////////////
        Hb(i,j) = (1/1+(D/D0)^2*n);
        ////////////////////guassian/////////////////
        Hg(i,j) = exp(-D^2/(2*D0)^2);
    end
end

gi = Is.*Hi
gb = Is.*Hb
gg = Is.*Hg

Gi = abs(ifft(gi))
Gb = abs(ifft(gb))
Gg = abs(ifft(gg))

figure(1)
subplot(1,3,1)
mesh(Hi)
title("ideal filter")

subplot(1,3,2)
mesh(Hb)
title("butterworth filter")

subplot(1,3,3)
mesh(Hg)
title("gaussian filter")


figure(2)
subplot(1,3,1)
imshow(uint8(255*Hi))
title("ideal filter")

subplot(1,3,1)
imshow(uint8(255*Hb))
title("butterworth filter")

subplot(1,3,1)
imshow(uint8(255*Hg))
title("gaussian filter")

figure(3)
subplot(1,3,1)
imshow(uint8(abs(gi)))
title("ideal filter")

subplot(1,3,2)
imshow(uint8(abs(gb)))
title("butterworth filter")

subplot(1,3,3);
imshow(uint8(abs(gg)));
title("gaussian filter");


figure(4);
subplot(1,3,1);
imshow(uint8(Gi));
title("ideal filter");

subplot(1,3,2);
imshow(uint8(Gb));
title("butterworth filter");

subplot(1,3,3);
imshow(uint8(Gg));
title('gaussian filter');


