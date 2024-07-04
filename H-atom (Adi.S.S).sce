//H-atom
funcprot()
clc;clear;clf
e=3.795;
a=0.00001;b=10
h=1973;m=0.511e6;ao=0.52;k0=9e9
n=1000
x=linspace(a,b,n)
t=x(2)-x(1)
xn=a+t:t:b-t
k=zeros(n-2,n-2)
for i=1:n-2
    k(i,i)=-2
    if (i<(n-2)) 
    k(i,i+1)=1
    k(i+1,i)=1
    end
end
KE=(-1*(h^2)/(2*m*t^2))*k
V=zeros(n-2,n-2);
for i=1:n-2
    V(i,i)=(-(e^2)/x(i+1));
end
H=KE+V
[psi,E]=spec(H)
printf("E_experimental\n\n")
for i=1:3
    disp(E(i,i))
end
title("H-atom radial wavefunctions and probability densities",'fontsize',5)
//Displaying Normalized Theoretical & Experimental Wavefunctions
for i=1:2
subplot(2,2,i)
psisq1=conj(psi(:,i)).*(psi(:,i))
nor1=inttrap(xn,psisq1)
npsi1=(psi(:,i))/sqrt(nor1)
npsin1=npsi1./xn'
if i==1
nwft1=2.*ao^(-3./2).*exp(-xn./ao)
else
nwft1=(1./((2.*ao).^(3./2))).*(2-(xn./ao)).*exp(-xn./(2.*ao))
end
plot(xn',npsin1,"c",'linewidth',6)
plot(xn',nwft1,"m:",'linewidth',2)
legend("normalised wave function ( expeimental/code )","normalised wave function ( theoretical )")
xlabel("r",'fontsize',4);ylabel("psi",'fontsize',4);
end

//Displaying Theoretical & Experimental Probability densities
for i=1:2
subplot(2,2,i+2)
psisq1=conj(psi(:,i)).*(psi(:,i))
nor1=inttrap(xn,psisq1)
npsi1=(psi(:,i))/sqrt(nor1)
if i==1
nwft1=2.*ao^(-3./2).*exp(-xn./ao)
else
nwft1=(1./((2.*ao).^(3./2))).*(2-(xn./ao)).*exp(-xn./(2.*ao))
end
nw1=nwft1.*xn
PDt1= conj(nw1).*nw1
np=conj(npsi1).*(npsi1)
plot(xn',np,"blue",'linewidth',2)
plot(xn',PDt1,"r:",'linewidth',3)
legend("probability density ( expeimental/code )","probability density ( theoretical )")
xlabel("u",'fontsize',4);ylabel("|psi|^2",'fontsize',4);
end
