clc;
clear all;
close;

/*wc = input('cutoff-freq')
N = input('Enter the length')*/


wc = 0.3
N = 15
a = (N-1)/2;
for n =0:N-1
    if n == a then
        hd(n+1) = wc/%pi;
     else
        hd(n+1) = (wc/%pi)*((sin(wc*(n-a)))/(wc*(n-a)));
      end;
end;

for n=0:N-1
    Wr(n+1) = 1;
    whamm(n+1) =0.54-(0.46*cos(2*%pi*n/N-1));
    whann(n+1) =0.5-(0.5*cos(2*%pi*n/N-1));
    Wb(n+1) = 0.42-(0.5*cos(2*%pi*n/N-1))+(0.08*cos(2*%pi*n/N-1));
end

for n=1:N
    h1(n) = hd(n)*Wr(n);
    h2(n) = hd(n)*whamm(n);
    h3(n) = hd(n)*whann(n);
    h4(n) = hd(n)*Wb(n);
end

[H1,w] =frmag(h1,256)
[H2,w] =frmag(h2,256)
[H3,w] =frmag(h3,256)
[H4,w] =frmag(h4,256)

subplot(4,1,1)
plot(w,H1)
title('rectangular window')

subplot(4,1,2)
plot(w,H2)
title('Hamming window')

subplot(4,1,3)
plot(w,H3)
title('Hanning window')

subplot(4,1,4)
plot(w,H4)
title('Black man window')






