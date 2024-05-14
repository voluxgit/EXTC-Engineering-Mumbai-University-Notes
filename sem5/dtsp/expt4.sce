clc
close 
clear all
[x fs] = wavread("C:\Users\varad\Downloads\Wav_868kb.wav");
noise = 0.095*rand(1,length(x(1,:)),"normal")
xn = x(1,:)+noise
h = ones(1,64)/64
y = conv(xn,h)

subplot(3,1,1)
xlabel("sampling frequency")
ylabel("Amplitude")
plot2d3(x(1,:))

subplot(3,1,2)
xlabel("sampling frequency")
ylabel("Amplitude")
plot2d3(xn(1,:))

subplot(3,1,3)
xlabel("sampling frequency")
ylabel("Amplitude")
plot2d3(y(1,:))

playsnd(x,fs)
sleep(5000)
playsnd(xn,fs)
sleep(5000)
playsnd(y,fs)
sleep(5000)
