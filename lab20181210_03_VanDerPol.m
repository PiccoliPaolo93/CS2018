
mu=[0.1,1,10,100];
mu=mu(4);
%y1=x y2=x'
y0=[1;1];
tspan=[0,100];
odefun=@(t,y)[y(2);mu*(1-y(1).^2).*y(2)-y(1)];

% ode23 è Runge-Kutta adattiva con RK2 e RK3
% ode45 è Runge-Kutta adattiva con RK4 e RK5
% ode23s e ode15s sono per equazioni stiff
% ode23s è RK implicito, ode15 è multistep adattivo implicito
%[tn,un]=ode23(odefun,tspan,y0);
%[tn,un]=ode45(odefun,tspan,y0);
%[tn,un]=ode23s(odefun,tspan,y0);
[tn,un]=ode15s(odefun,tspan,y0);
figure(1); clf
plot(tn,un(:,1),'.--');
grid on
xlabel('t');
ylabel('x(t)');
Nh=length(tn);
title(['Nh=',num2str(Nh)])
fprintf('ode23, Nh=%d \n', Nh);
% è un'equazione stiff
% un metodo non programmato appositamente per queste equazioni richiede h
% molto piccolo non per motivi di accuratezza ma per garantire assoluta
% stabilita'


