close all

xmin=0.996;
xmax=1.004;
points=10;
x=linspace(xmin,xmax,points);

p1=@(x)((x-1).^6);
p2=@(x)(x.^6-6*x.^5+15*x.^4-20*x.^3+15*x.^2-6*x+1);
p3=@(x)(1+x.*(-6+x.*(15+x.*(-20+x.*(15+x.*(-6+x))))));

y1=p1(x);
y2=p2(x);
y3=p3(x);

figure(1); clf

plot(x,y2,x,y3,x,y1)
legend('p2','p3','p1')
grid on