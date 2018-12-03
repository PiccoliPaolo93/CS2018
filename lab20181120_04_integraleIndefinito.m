clear

f=@(x)cos(x).^2.*exp(-x);
a=0;
b=inf;
toll=1e-3;

beta=-log(1e-3/2);

syms x
F=cos(x).^2.*exp(-x);
F2=diff(F,2);
f2=matlabFunction(F2);

xx=linspace(a,beta,1000);
maxf2=max(abs(f2(xx)));

figure(1); clf
fplot(f,[a,beta])
hold on
fplot(f2,[a,beta])
grid on
legend('f','f2');

Hmax=(1e-3/2*12/(beta-a)/maxf2)^(1/2)
M=ceil((beta-a)/Hmax)

f=matlabFunction(F);
xx=linspace(a,beta,M+1);
y=f(xx);
It=trapz(xx,y)
