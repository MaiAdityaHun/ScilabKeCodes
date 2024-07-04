//Particle in a box
clc;clear;clf
a=0;b=10
h=1;m=1
n=101
t=(b-a)/n
x=a:t:b
xn=a+t:t:b-t
k=zeros(n-1,n-1)
for i=1:n-2
    k(i,i)=-2
    k(i,i+1)=1
    k(i+1,i)=1
end
k(n-1,n-1)=-2
KE=(-1*(h^2)/(2*m*t^2))*k
[psi,E]=spec(KE)
for i=1:n-1
    et(i)=(((i^2)*(%pi)^2)*(h^2))/(2*m*100)
end
printf("E_theoretical                                                       E_experimental\n\n")
for i=1:4
    printf('%2.4f\t\t\t%3.4f\n',et(i),E(i,i))
end
for i=1:n-1
    for j=1:4
        pt(i,j)=(sqrt(2/(b-a)))*sin(j*xn(i)*%pi/(b-a))
    end
end

for i=1:4
    subplot(2,2,i)
    plot(xn',psi(:,i))
    plot(xn',pt(:,i),"c",'linewidth',4)
    psisq=(conj(psi(:,i)).*psi(:,i))
    nor=inttrap(xn,psisq)
    if i==2|i==3
        npsi=-1*(psi(:,i))/sqrt(nor)
    else
        npsi=(psi(:,i))/sqrt(nor)
    end
    plot(xn',npsi,"r:",'linewidth',2)
    legend("Experimental","Theortical","Normalized")
    xlabel("x");ylabel("psi");
    title("Free particle in a Box State: "+string(i))
end
