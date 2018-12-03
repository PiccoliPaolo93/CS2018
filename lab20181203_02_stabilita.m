lambda=-2;

odefun=@(t,y)lambda*y;
y0=1;

yex=@(t)exp(lambda*t);

t0=0;
T=10;

tspan=[t0,T];

h0=(-2*real(lambda))/(abs(lambda)^2)

H=[0.01,0.1,1,2];
figure(1); clf
grid on
xlabel('t')
fplot(yex,tspan,'b');
hold on
pause

for h=H
    Nh=fix((T-t0)/h);
    [tn,un]=cranknicolson(odefun,tspan,y0,Nh);
    plot(tn,un,'.--')
    legend('yex','EE');
    title(['h=',num2str(h)]);
    pause
end