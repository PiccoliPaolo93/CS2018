clear all;
xmin=-5;
xmax=2;
x=linspace(xmin,xmax,1000);
f=@(x)exp(x)+x;
fplot(f,[xmin xmax])
grid on
[z,k,res]=myBisezione(f,-1,0,1.e-8,50);
fprintf('z=%f, iterazioni=%d, residuo=%f\n',z,k,res);
hold on
plot(z,res,'o')