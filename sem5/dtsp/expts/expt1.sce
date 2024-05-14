//varad patil
//120A2036
//program for linear convolution using direct method
clc;
clear all;
close;
x = input('enter the sequence x =');
h = input('Enter the sequence h =');
L = length(x);
M = length(h);
x = [x zeros(1,M-1)]
h = [h zeros(1,L-1)]
 for n=1:L+M-1
    y(n)= 0
    for k=1:L
    if(n-k+1>0)
        y(n) = y(n)+x(k)*h(n-k+1);
    end;
    end;
 end;
disp(y,'linear conolution using direct method is');
//program for linear convolution using dft method
X= fft(x,-1); // -1 denotes direct form
H= fft(h,-1);
Y = X.*H; //elementwise multiplication
y = fft(Y,1); // 1 denotes inverse form
disp(y,'linear conolution using DFT method is');
