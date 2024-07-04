n=0:5
x=[-1:0.01:1]'
y=legendre(n,0,x)'
disp(y)
plot2d(x,y,leg='P0@P1@P2@P3@P4@P5')
xtitle('The first six Legendre Polynomials')
ylabel('Pn(x)')
xlabel('x')
