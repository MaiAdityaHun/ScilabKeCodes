clear
clc
function pL=legendrepol(n, var) //Generates the Legendre polynomial of order n in variable var
if modulo(n,2) == 0 then //check order of polynomial is even or not
M = n/2
else
M = (n-1)/2
end
cc = zeros(1,M+1) //intialize coefficient matrix with zero
for m = 0:M //loop to find coefficients of polynomial
k = n-2*m //coefficients which are required
cc(k+1)=(-1)^m*factorial(2*n-2*m)/(2^n*factorial(m)*factorial(n-m)*factorial(n-2*m)) //legendre polynomial formula for coefficients
end
pL = poly(cc,var,'coeff') //generate polynomials
endfunction
//main program
nn=input('enter order of polynomial:')
p(nn+1) = legendrepol(nn,'x') //call legendre polynomial function to find polynomials
printf('P%i(x)=',nn) //display polynomials
disp(p(nn+1))
xx = [-1:0.01:1] //x-axis data for plotting
n0 = length(xx) //no of data point on x axis
pp = horner(p(nn+1),xx) //find polynmial value at every x axis point
plot2d(xx,pp)
xtitle('Legendre polynomials','x','Pn(x)')
