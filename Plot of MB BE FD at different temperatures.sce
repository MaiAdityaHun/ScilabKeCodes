//Plot of MB BE FD at different temperatures
clc;clear;clf;
T=100:200:900 ;Tc=700 
k=1.38e-23 ;e=1.6e-19; u=0 
E=-0.3:0.001:0.3;E1=0:0.001:0.6
distribution=['BE','MB','FD']
alpha=-1
for i=1:3
    for j=1:length(T)
        for m=1:length(E) 
            b=1/(k*T(j))
            f(m,j)=(exp((E(m)-u)*e*b)+alpha).^-1 
        end
    end
    alpha=alpha+1
    subplot(2,2,i)
    plot(E',f)
    xtitle('Distribution function for '+string(distribution(i))+' statistics','E(eV)','f(E)')
    legend('T='+string(T)+'K')
    C(:,i)=f(:,2)
end
subplot(2,2,4)
plot(E1',C)
legend('T='+string(distribution)+'K')
xtitle('comparison of MB,BE,FD Distribution function at temp T=700k','E(eV)','f(E)')
