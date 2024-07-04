//Least Square Fitting
clc;clear;clf;
x=[0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9]
y=[12.8,14.3,15.9,17.1,19.4,20.9,22.4,24.1,26.0]
sumx=0
sumy=0
sumxy=0
sumx2=0
for  i=1:9
sumx=sumx+x(i)
sumy=sumy+y(i)
sumxy=sumxy+x(i)*y(i)
sumx2=sumx2+(x(i)^2)
end
disp(sumx,sumy,sumxy,sumx2)
m=((9*sumxy)-(sumx*sumy))/((9*sumx2)-(sumx)^2)
c=(1/9)*(sumy-(m*sumx))
disp(m,c)
for i=1:9
    ynew(i)=m*x(i)+c
end
disp(ynew)
plot2d(x,y,-3)
plot2d(x,ynew,3)
title("Least Square Fitting")
legend("Raw Data","Fitted Data",4)
xlabel("x")
ylabel("y")
