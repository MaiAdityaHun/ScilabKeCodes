clc();clear
n=input("No. of elements in x and y = ")
//n=input("No. of elements in y = ")
disp("enter elements in x")
for i=1:n
    x(i)=input("-")
end
h=x(2)-x(1)
disp("enter elements in y")
for j=1:n
    y(j,1)=input(".")
end
for j=1:n //calculate finite differences and save them as 2nd, 3rd......column of matrix y
for i=1:n-j
y(i,j+1)=y(i+1,j)-y(i,j)
end
end
disp('  x  y  dy  d2y  d3y')
disp(y)
xp=input('x at which y is to be find=')
p=(xp-x(1))/h //xp=xo+ph
u=p
yp=y(1,1)
for i=1:n-1 //Newton forward interpolation for yp at xp
yp=yp+p*y(1,i+1)/factorial(i)//yp=y0+p*dy0+p*(p-1)*d2y0/2!+...
p=p*(u-i)
end
disp('interpolated value at '+string(xp)+' = '+string(yp))
printf('interpolated polynolmial is:\n y(x)=')
polynomial=y(1,2)
s=poly(0,'x')
xl=s-x(1) //xl=x-x0
xe=xl
for i=2:n //newton forward interpolation formula for polynomial
polynomial=polynomial+(y(1,i)*xl)/((h^(i-1))*factorial(i-1))
xl=xl*(xe-x(i)) //(x-x0)*(x-x1)(x-x2)........
end
disp(polynomial)
