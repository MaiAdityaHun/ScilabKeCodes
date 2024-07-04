//Scilab Program for Least Square Fitting clc; 
clear;clc;clf;
x=[0;1;2;3;4;5;6;7;8];
y=[1;7;15;33;34;52;55;66;75] 
X1=sum(x) 
Y1=sum(y) 
XY=sum(x.*y) 
Xsq=sum(x.^2)  
A=[Xsq X1;X1 9]
 B=[XY;Y1] 
ynew=inv(A)*B 
disp(ynew(1),"The slope of best fit line is");
disp(ynew(2),"And the constant is");
scatter(x,y) 
plot(x,ynew(1)*x+ynew(2),'-.r')
title('Linear Fitting by Matrix Method','fontsize',5);
legend('linear data','fitted data',4)

