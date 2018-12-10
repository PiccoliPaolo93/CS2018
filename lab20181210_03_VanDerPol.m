
mu=[0.1,1,10,100];
mu=10;
%y1=x y2=x'
y0=[1;1];
tspan=[0,100];
odefun=@(t,y)[y(2);mu*(1-y(1).^2).*y(2)-y(1)];

[tn,un]=ode23(odefun,tspan,y0);
figure(1); clf
plot(tn,un(:,1),'.--');
grid on
