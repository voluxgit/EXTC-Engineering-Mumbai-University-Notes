clc;
close;
clear all;
x = input('enter the input');
N = input('enter the input ');
l = length(x);
x = [x zeros(1,N-1)];
for k=1:N
    X(k) = 0;
    for n=1:N
        X(k) = X(k) + x(n)*exp((%i*-2*%pi*(k-1)*(n-1))/N);
        end;
end;
disp('the output is');
disp(X);
[phase, mag] = phasemag(X);
subplot(2,1,1);
plot2d3(phase);
title('phase');
subplot(2,1,2);
plot2d3(mag);
title('magnitude');
