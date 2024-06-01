clc;
clear;
clf;

SNR = 0;
for i = 1:10
    SNR = SNR + 2;
    C = log(1 + 10^(SNR/10)/log(2));
    X(i) = SNR;
    Y(i) = C;
end

plot(X, Y, 'r-');

NR = 2;
SNR = 0;
for i = 1:10
    SNR = SNR + 2;
    C = zeros(1, 1000);
    for j = 1:1000
        C(j) = NR * log(1 + (10^(SNR/10)) * (abs(rand(1, 1, 'normal')))) / log(2);
    end
    X(i) = SNR;
    Y(i) = mean(C);
end

plot(X, Y, 'b-');
NR = 3;
SNR = 0;
for i = 1:10
    SNR = SNR + 2;
    C = zeros(1, 1000);
    for j = 1:1000
        C(j) = NR * log(1 + (10^(SNR/10)) * (abs(rand(1, 1, 'normal')))) / log(2);
    end
    X(i) = SNR;
    Y(i) = mean(C);
end

plot(X, Y, 'g-');
NR = 4;
SNR = 0;
for i = 1:10
    SNR = SNR + 2;
    C = zeros(1, 1000);
    for j = 1:1000
        C(j) = NR * log(1 + (10^(SNR/10)) * (abs(rand(1, 1, 'normal')))) / log(2);
    end
    X(i) = SNR;
    Y(i) = mean(C);
end

plot(X, Y, 'y-');
title('SNR vs Channel capacity for different MEMO system');
xlabel('SNR');
ylabel('Channel capacity');
