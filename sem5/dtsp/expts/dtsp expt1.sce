clc;
clear all;
close;
x = input("enter the input of x");
h = input("enter the of y");
L = length(x);
M = length(h);
x = [x zeros(1,M-1)];
h = [h zeros(1,L-1)];

for n=1:L+M-1
    y(n) = 0;
    for k=1:L
        if (n-k+1>0)
        y(n) = y(n) + x(k)*h(n-k+1)
    end;
end;
end;
disp('The output is');
disp(y);

X = fft(x,-1);
H = fft(h,-1);
Y = X.*H;
y = fft(Y,1);
disp('The output is');
disp(y);
