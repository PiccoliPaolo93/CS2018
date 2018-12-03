clear;
load potenziale.mat

%1
figure(1); clf
spy(AFE)

xM=AFE\f;

%% risoluzione con metodo diretto
tic
R=myCholeski(AFE);
y=forSub(R',f);
x=backSub(R,y);
toc

diff=norm(x-xM);

figure(2); clf
spy(R)

plotsol(x,nodes,nov,lint);

format short
KA=cond(full(AFE))

stima=KA*eps/2

%% risoluzione con gradiente coniugato
n=length(f);
tol=1.e-6;
kmax=1000;
x0=zeros(n,1);
tic
[xGC,k,res,resv]=gradienteCon(AFE,f,x0,kmax,tol);
toc
plotsol(xGC,nodes,nov,lint);
figure(5); clf
semilogy(resv);
grid on
xlabel('iterazioni k');
ylabel('residuo normalizzato');