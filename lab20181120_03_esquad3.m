f1=@(x)exp(x).*cos(x);
f2=@(x)sqrt(x.*(1-x));

a1=0;
a2=0;
b1=pi;
b2=1;

syms x
F1=exp(x)*cos(x);
F1_4=diff(F1,4);
f1_4=matlabFunction(F1_4);
xx=linspace(a1,b1,1000);
y1_4=f1_4(xx);
massimof1_4=max(abs(y1_4))

figure(1); clf
fplot(f1_4,[a1,b1])
grid

H1max=(1e-4*16*180/(b1-a1)/massimof1_4)^(1/4)
M1=ceil((b1-a1)/H1max)

Isc=simpsonc(f1,a1,b1,M1)
