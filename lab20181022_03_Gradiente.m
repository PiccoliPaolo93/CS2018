A=[6 1 -2 2 1;1 3 1 -2 0;-2 1 4 -1 -1;2 -2 -1 4 2;1 0 -1 2 3]
b=[15;2;3;21;21]

x0=rand(5,1);
kmax=1000;
tol=1.e-12;

[x,k,res,resv]=gradiente(A,b,x0,kmax,tol);
x
k
res

KA=cond(A);
rapp=(KA-1)/(KA+1);

[xCon,kCon,resCon,resvCon]=gradienteCon(A,b,x0,kmax,tol)

figure(1); clf
semilogy(resv)
hold on
semilogy(resvCon)
xlabel('iterazioni k')
ylabel('residuo normalizzato')
grid on
legend('Gradiente','Gradiente coniugato')