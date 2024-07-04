//Macrostates vs no. of Heads
clc;clear;clf
n=[10,20,30]
l=length(n);
for j=1:l
    for i=0:n(j)
        p=2^(n(j));
        P(i+1,j)=factorial(n(j))/(p*factorial(i)*factorial(n(j)-i))
    end
end
    m=0:1:max(n)
plot(m',P)
title("Prob. of macrostates vs no. of Heads",'fontsize','5')
xlabel("Number of heads",'fontsize','4','fontcolour','r')
ylabel("Probability of Macrostate",'fontsize','4','fontcolour','r')
legend("90 Coins","120 Coins","150 Coins")
