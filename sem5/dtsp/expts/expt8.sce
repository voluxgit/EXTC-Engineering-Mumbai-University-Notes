//varad patil
//120A2036

clear;
clc

z=poly(0,'z')


function beq=truncround(b, n, flag)
    l=0;
    d=abs(b);
    while fix(d)>0
        l=l+1
        d=d/2
        //d=abs(b)/(2^l);
    end
    
    if flag==1
        beq=fix(abs(b)*2^(n-l));
    end
    if flag==2
        beq=fix(abs(b)*2^(n-l)+0.5);
    end
    beq=sign(b).*beq.*2^-(n-l);
endfunction

[Hz1]=iir(3,'lp','cheb1',[0.3 0],[0.08 0.02])
disp("Transfer Function: ", Hz1)
b = coeff(Hz1.num)
a = coeff(Hz1.den)
disp("Numerator coefficients: ", b)
disp("Numerator coefficients: ", a)
[Hw fr]=frmag(Hz1,100)

disp(' ')
flag=input('enter 1 for truncation, 2 for rounding=');

bq=truncround(b,6,flag);
aq=truncround(a,6,flag);

disp("Numerator coefficients: ", bq)
disp("Numerator coefficients: ", aq)

H1=0
H2=0
for  i = 1:length(bq)
    H1 = H1 + bq(i)*(z^(i+1))
end



for  i = 1:length(aq)
    H2 = H2 + aq(i)*(z^(i+1))
end

Hz2 = H1./H2
[Hwq fr]=frmag(Hz2,100)

figure(1)
plot(fr,20*log10(abs(Hw)));
plot(fr,20*log10(abs(Hwq)),'--');
xlabel('frequency');
ylabel('Gain,dB');

if flag==1
    legend('without quantization','with truncation');
end
    if flag==2
legend('without quantization','with rounding');
end
