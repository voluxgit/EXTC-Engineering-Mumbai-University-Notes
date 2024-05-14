close;
clear all;
img1 = imread("D:\college related\Third year\sem6\IPMV\CODE\cameraman.png");
g = rgb2gray(img1);
[r c] =size(g)
for i = 1:r
    for j = 1:c
        b(i,j) = 255 - g(i,j)
    end
end
imshow(b);

//////////////////////////////////////contrast stretching
img = imread("D:\college related\Third year\sem6\IPMV\CODE\cameraman.png");
img = rgb2gray(img)
[x y] = size(img)
l = 256;
s1 = 50;
s2 = 100;
r1 = 100;
r2 = 150;
m1 = s1/r1;
m2 = (s2-s1)/(r2-r1);
m3 = (l-1-s2)/(l-1-r2);

for a = 1:x
    for b = 1:y
        r = g(a,b);
        if r < r1 then
            s(a,b) = m1*r
        elseif r1 <= r & r <= r2 then
            s(a,b) = m2*(r-r1) + s1
        else 
            s(a,b) = m3*(r-r2) + s2
        end
    end
end

img2 = [img s];
imshow(img2);


