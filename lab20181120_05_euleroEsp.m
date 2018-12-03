odefun=@(t,y)t-y;

t0=-1;
T=3;

tspan=[t0,T];
y0=1;

h=0.125;
Nh=fix((T-t0)/h);

[tn,un]=eulero_esp(odefun,tspan,y0,Nh);

figure(1); clf
plot(tn,un,'.--','MarkerSize',20);
grid
xlabel('t');
ylabel('un');

yex=@(t)t-1+3*exp(-(t+1));
hold on
fplot(yex,tspan)
% definisco vettore valori esatti in tn
yn=yex(tn);
err=max(abs(yn-un))
