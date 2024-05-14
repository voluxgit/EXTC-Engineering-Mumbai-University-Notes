clear all;
clc;
close;
x = input("enter the input ");
N = length(x)
H =[0]
for n=1:N
    H=H+x(n)*%z^(-n+1);
end
disp('The ouput is',H);
[z,p,k]= tf2zp(H);
disp('The z transform of impulse response is ',H);
disp('The zeros of impulse response is ',z)
disp('The poles of impulse response is ',p)
disp('Made By Varad Patil 120A2036');
plzr(H);
