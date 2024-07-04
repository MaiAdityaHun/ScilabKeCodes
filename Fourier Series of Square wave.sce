//FOURIER SERIES
//f(x)=square wave defined over an interval (-pi,pi)
clc;clear;clf;
ea=1e-8;
er=1;
a=-%pi;
b=%pi;
//Calculation of a0
function y=s(x)
    if x>0&x<%pi then
        y=+1
    else
        y=-1
    end
endfunction
a0=intg(a,b,s)/%pi
//Calculation of an
title('Fourier Series of Square wave','fontsize',4);
for k=1:4
    n=1+(k-1)*9
for i=1:n
function y1=q(x)
    y1=s(x)*cos(i*x)
endfunction
an(i)=intg(a,b,q,ea,er)/%pi
end
//Calculation of bn
for i=1:n
function y2=r(x)
    y2=s(x)*sin(i*x)
endfunction
bn(i)=intg(a,b,r,ea,er)/%pi
end
x=linspace(a,b,1000)
n1=length(x)
for j=1:n1
    par(j)=s(x(j))
    A(j)=0
    B(j)=0
    for i=1:n
        A(j)= A(j)+ an(i)*cos(i*x(j))
        B(j)= B(j)+ bn(i)*sin(i*x(j))
    end
    C(j)=(a0/2)+A(j)+B(j);
end
subplot(2,2,k)
plot(x',C,'r');
plot(x',par);
xgrid;
xlabel('X','fontsize',3);
ylabel('f(x)','fontsize',3);
legend(["number of terms= "+string(n)],4)
end
