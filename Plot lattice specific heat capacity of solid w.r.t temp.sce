//Plot *lattice* specific heat capacity of solid w.r.t temp
funcprot(0);clc;clear;clf
R=8.314
T=0:1:500
Td=340
Te=240
title("Plot of Specific Heat capacity of solid w.r.t temp",'fontsize',4)
//Dulong Petit law
Dp=3*R
//Einstein law
for i=1:length(T)
    k(i)=Te/T(i);
    Ein(i)=(3*R)*(k(i)^2)*((exp(k(i)))/((exp(k(i))-1)^2))
end
//Debye law
function x=f(y)
    x=((y^4)*exp(y))/(exp(y)-1)^2
endfunction
for i = 1:length(T)
   K(i)=Td/T(i)
   if T(i)==0 then
       Deb(i)=0
       else
   D=intg(0,K(i),f,0.0001);
   Deb(i)=9*R*(K(i).^-3)*D
   end
end
//for copper
plot(T',Dp,'--m')
plot(T',Ein,'g')
plot(T',Deb,'r')
xlabel("Temp (K)")
ylabel("Cv   (J/Kg.K)")
legend("Dulong Petit law","Einstein law","Debye law",4)
