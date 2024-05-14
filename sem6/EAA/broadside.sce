//broadside for n=10 sources

clc
close all
clear
n=10
lambda = 1
d=lambda/4

//for broadside beta=0 and psi=90 or 270
beta = 0
theta = 0.0001:0.01:2*%pi
k = (2*%pi)/lambda
psi = k*d*cos(theta) + beta
AF= sin(n*psi/2)./(n*sin(psi/2))
xset('line style','3')
polarplot(theta, AF)
title("POLAR PLOT FOR ARRAY FACTOR PATTERN FOR N ELEMENT UNIFORM AMPLITUDE BROADSIDE ARRAY CASE: N=10, d=λ/4 and d=λ β=0")
h1=legend('d=λ/4','d=λ')
