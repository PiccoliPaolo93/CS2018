M=10;
a=0;
b=1;
tol=1.e-3;
hmin=1.e-3;
f=@(x)1./((x-.3).^2+0.01)+1./((x-.9).^2+0.04)-6;

x=linspace(a,b);
y=f(x);
figure(1); clf
plot(x,y)
grid on;

Isc=simpsonc(f,a,b,M)

[isa,nodi]=simpad(f,a,b,tol,hmin);
isa

hold on
n=length(nodi);
yn=f(nodi);
plot(nodi,yn,'rx');
plot(nodi,0,'mx');
legend('funzione','nodi','nodi sull"asse');
title(['tol=',num2str(tol),' - n. nodi=',num2str(n)])

%% esempio 2
a=0;
b=2;
tol=1.e-6;
hmin=1.e-6;
f=@(x)1./(x.^3-2*x-5);

x=linspace(a,b);
y=f(x);
figure(2); clf
plot(x,y)
grid on;

Isc=simpsonc(f,a,b,M)

[isa,nodi]=simpad(f,a,b,tol,hmin);
isa

hold on
n=length(nodi);
yn=f(nodi);
plot(nodi,yn,'rx');
plot(nodi,0,'mx');
legend('funzione','nodi','nodi sull"asse');
title(['tol=',num2str(tol),' - n. nodi=',num2str(n)])
