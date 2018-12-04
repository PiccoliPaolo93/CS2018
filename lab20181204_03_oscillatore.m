Fext=@(t)0;
R=0;
K=0.53;
m=2;
L=30;
x0=10;

H=[1,0.1,0.01];
t0=0;
T=100;
tspan=[t0,T];

%odefun=@(t,y)[y(2);(-K.*y(1)-R.*y(2))/m+Fext(t)/m];
A=[0,1; -K/m, -R/m];
odefun=@(t,y)A*y;

y0=[x0;0];
figure(1); clf

i=1;
for h=H
    Nh=fix((T-t0)/h);
    [tn,un]=eulero_esp_sys(odefun,tspan,y0,Nh);
    subplot(3,1,i);
    i=i+1;
    plot(tn,L+un(:,1))
    title(['Eulero Esplicito h=',num2str(h)]);
    grid on
    xlabel('t'); ylabel('P');

end

figure(2); clf

i=1;
for h=H
    Nh=fix((T-t0)/h);
    [tn,un]=eulero_imp_s(odefun,tspan,y0,Nh);
    subplot(3,1,i);
    i=i+1;
    plot(tn,L+un(:,1))
    title(['Eulero Implicito h=',num2str(h)]);
    grid on
    xlabel('t'); ylabel('P');

end

figure(3); clf

i=1;
H=[0.5,2.5,5,6];
for h=H
    Nh=fix((T-t0)/h);
    [tn,un]=rk4(odefun,tspan,y0,Nh);
    subplot(2,2,i);
    i=i+1;
    plot(tn,L+un(:,1),tn,un(:,2))
    title(['Runge Kutta h=',num2str(h)]);
    grid on
    xlabel('t'); ylabel('P');
    legend('y1','y2','location','west');

end
lambdas=eig(A)
figure(4); clf
plot(lambdas,'*')
grid on