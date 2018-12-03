odefun=@(t,y)[-3*y(1)*y(2)+y(1);-y(2)+y(1)*y(2)];

tspan=[0,50];
y0=[1;1];

h=0.001;
Nh=fix((tspan(2)-tspan(1))/h);

[tn,un]=eulero_esp_sys(odefun,tspan,y0,Nh);

figure(1); clf

plot(tn,un(:,1),tn,un(:,2))
grid on
xlabel('t')
legend('y1(t)','y2(t)','location','northwest')

figure(2); clf
% rappresento la traiettoria del sistema o piano delle fasi
plot(un(:,1),un(:,2))
grid on
xlabel('y1-preda');
ylabel('y2-predatore');
hold on
plot(un(1,1),un(1,2),'*')
