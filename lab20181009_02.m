close all;
fig1=figure(1); clf
F=@(x)(x-5).^2-3*sin(x-5);
fplot(F,[0,14]);
grid on
hold on
f=@(x)2*(x-5)-3*cos(x-5);
fplot(f,[0,14]);
df=@(x)2+3*sin(x-5);
fplot(df,[0,14]);
legend('f','df','d2f');
xlabel=('x');
ylabel=('y');

tol=1.e-8;
kmax=50;

x0=8;
[zero,res,k,err]=myNewton(f,df,x0,tol,kmax)
figure(2); clf
semilogy([0:k],err)
grid on
