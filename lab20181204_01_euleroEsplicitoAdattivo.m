clear
odefun=@(t,y)-(2+3i).*y;
y0=1+0i;

tol=1e-2; hmin=1.e-4;
%tol=1.e-3; hmin=1.3-4;

t0=0;
T=5;

tspan=[t0,T];

[tn,un]=eulero_adattivo(odefun,tspan,y0,tol,hmin);

figure(1); clf
subplot(1,2,1);
plot(tn,real(un),'.--',tn,imag(un),'.--')
hold on
plot(tn,zeros(size(tn)),'+--');
grid on
title(['espilon=',num2str(tol)]);
legend('Real','Imm','tn');
xlabel('tn');
ylabel('un');

%---------------------------
tol=1.e-3; hmin=1.3-4;

[tn,un]=eulero_adattivo(odefun,tspan,y0,tol,hmin);

subplot(1,2,2);
plot(tn,real(un),'.--',tn,imag(un),'.--')
hold on
plot(tn,zeros(size(tn)),'+--');
grid on
title(['espilon=',num2str(tol)]);
legend('Real','Imm','tn');
xlabel('tn');
ylabel('un');
