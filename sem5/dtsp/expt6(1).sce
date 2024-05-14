clc
clear all
close
n = 5
ftype ='lp'
fdesign = 'butt'
ripple = [0.03 0]
frq = [0.3 0]

subplot(2,2,1)
Hz = iir(n,ftype,fdesign,frq,ripple)
[Hz, w] = frmag(Hz, 256)
xlabel('Frequency')
ylabel('gain')
plot(w, Hz, 'r')

subplot(2,2,2)
fdesign = 'cheb1'
Hz = iir(n,ftype,fdesign,frq,ripple)
[Hz, w] = frmag(Hz, 256)
xlabel('Frequency')
ylabel('gain')
plot(w, Hz, 'b')

ftype ='hp'
fdesign = 'butt'
subplot(2,2,3)
Hz = iir(n,ftype,fdesign,frq,ripple)
[Hz, w] = frmag(Hz, 256)
xlabel('Frequency')
ylabel('gain')
plot(w, Hz, 'r')

subplot(2,2,4)
fdesign = 'cheb1'
Hz = iir(n,ftype,fdesign,frq,ripple)
[Hz, w] = frmag(Hz, 256)
xlabel('Frequency')
ylabel('gain')
plot(w, Hz, 'b')
