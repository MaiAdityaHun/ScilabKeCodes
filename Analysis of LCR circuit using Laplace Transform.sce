//LAPLACE TRANSFORM FOR LCR CIRCUITS
clear;clc;clf
funcprot(0)
s=linspace(0.1,3,500)
t=linspace(0.1,1000,500)
a=0;b=100;R=5;L=1000;C=10;V=1000
A=(V/L)
A1=R/(2*L)
B=sqrt((1/L*C)-(R/(2*L))^2)
for i=1:500
    function y=g(t)
        y =(A)*(1/B)*exp(-A1*t)*exp(-s(i)*t)*(sin(B)*t)
    endfunction
I(i)= intg(a,b,g)
end
for i=1:500
    D(i)=(A)*exp(-A1*t(i))*(1/B)*sin(B*t(i))
end
subplot(1,2,1)
plot(s',I)
title("Laplace transform")
xlabel("s");ylabel("I(A)")
subplot(1,2,2)
plot(t',D,'r')
title("Inverse laplace transform")
xlabel("t")
ylabel("I(A)")
