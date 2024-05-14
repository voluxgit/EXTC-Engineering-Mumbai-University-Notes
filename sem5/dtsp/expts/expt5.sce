clc
clear all
close
s =poly(0,'s')
z = poly(0,'s')
Hs =s*s/((s+1)*(s+2))
T =1
pf =pfss(Hs)
for i =1:length(pf)
disp("Factorised H(s):")
disp(pf(i))
end
[Z p K]=tf2zp(Hs)
A1 = coeff(pf(1).num)
A2 = coeff(pf(2).num)
//IIT
disp('Impulse Invariant Technique:')
Hz = (A1/(1 - %e^(-p(1)*T)*z^-1)) + (A2/(1 - %e^(-p(2)*T)*z^-1))
disp(Hz)
//BLT
disp('BLT ')
Hz = horner(Hs,(2/T)*[(1-z^-1)/(1+z^-1)])
disp(Hz)
