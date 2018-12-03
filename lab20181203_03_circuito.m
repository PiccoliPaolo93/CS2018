L=0.1;
R1=10;
R2=10;
C=1.e-3;
e=5;

tspan=[0 0.1];
y0=[0,0];
odefun=@(t,y)[(y(2)-y(1)/R2)/C;(-y(2)*R1-y(1)+e)/L];

h=0.001;
Nh=fix((tspan(2)-tspan(1))/h);
[tn,un]=eulero_esp_sys(odefun,tspan,y0,Nh);

figure(1); clf
plot(tn,un(:,1),'.--','Linewidth',2)
hold on
plot(tn,un(:,2),'.--','Linewidth',2)
legend('v(t)','i1(t)');
xlabel('t')
grid on

figure(2); clf
plot(un(:,1),un(:,2))
hold on
plot(un(1,1),un(1,2),'r*') % condizione iniziale del sistema
grid on
xlabel('v(t)')
ylabel('i1(t)')
