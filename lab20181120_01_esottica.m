a=3e-4;
b=14e-4;
T=213;

f=@(x)2.39e-11./(x.^5.*(exp(1.432./(T*x))-1));

x=linspace(a,b,51);
y=f(x);

%approssimo l'integrale con trapezi
It=trapz(x,y)

figure(1); clf
subplot(2,2,1)
plot(x,y)
grid on
title('f')

%calcolo con il toolbox di calcolo simbolico la derivata seconda
syms x
F=2.39e-11./(x.^5.*(exp(1.432./(213*x))-1));
F1=diff(F);
F2=diff(F,2);

f1=matlabFunction(F1);
f2=matlabFunction(F2);
y1=f1(x);
y2=f2(x);

subplot(2,2,2)
fplot(f1,[a,b])
grid on
title('f1')

subplot(2,2,3)
fplot(f2,[a,b])
grid on
title('f2')

H=(b-a)/50;
err=(b-a)/12*H^2*2.545e8;

Hmax=sqrt(12e-10/(2.545e8*(b-a)))
nMin=ceil((b-a)/Hmax)