clc;clear;clf
m=940e6;D=0.755501;alp=1.44;r0=0.131349;ao=0.52
h=1973;a=0.01;b=30;n=500
x=linspace(a,b,n)
t=x(2)-x(1)
xn=a+t:t:b-t
k=zeros(n,n)
for i=1:n
    k(i,i)=-2
    if (i<(n)) 
    k(i,i+1)=1
    k(i+1,i)=1
    end
end
KE=(-1*(h^2)/(2*m*t^2))*k
V=zeros(n,n);
for i=1:n
    x1(i)=(x(i)-r0)/x(i)
    V(i,i)=D*(exp(-2*alp*x1(i))-exp(-alp*x1(i)))
end
H=KE+V
[psi,E]=spec(H)
for i=1:6
psisq1=conj(psi(:,i)).*(psi(:,i))
nor1=inttrap(x,psisq1)
npsi1=(psi(:,i))/sqrt(nor1)
z=max(psi(:,1))+3
plot(x',[npsi1]+z*i)
end
plot(x',100*(D*(exp(-2*alp*0.2*(x+1.6))-exp(-alp*0.2*(x+1.6))))+20,"r")
