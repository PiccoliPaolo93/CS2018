%   Osserviamo che crank nicolson è più preciso

%   OSS1: fissato il metodo, la soluzione ottenuta con h minore è più accurata

%   OSS2: fissato h, calcolo due soluzioni numeriche con due metodi diversi, la
%   soluzione ottenuta con il metodo di ordine maggiore è quella più
%   accurata


odefun=@(t,y)t-y;

t0=-1;
T=3;

tspan=[t0,T];
y0=1;

yex=@(t)t-1+3*exp(-(t+1));
figure(1); clf
fplot(yex,tspan)
grid
xlabel('t');
ylabel('un');
hold on

Err=[];

h=0.1;
Nh=fix((T-t0)/h);

[tn1,un1]=eulero_esp(odefun,tspan,y0,Nh);
plot(tn1,un1,'.--','MarkerSize',20);
[tn2,un2]=eulero_imp(odefun,tspan,y0,Nh,1.e-3,10);
plot(tn2,un2,'.--','MarkerSize',20);
[tn3,un3]=cranknicolson(odefun,tspan,y0,Nh,1.e-3,10);
plot(tn3,un3,'.--','MarkerSize',20);
legend('Esatta','Eulero Esplicito','Eulero Implicito','Crank Nicolson','location','northwest')
yn=yex(tn1);
err1=max(abs(yn-un1));
err2=max(abs(yn-un2));
err3=max(abs(yn-un3));

fprintf('h=%f, err_ee=%f, err_ei=%f, err_cn=%f\n',h,err1,err2,err3)

% figure(2); clf
% loglog(H,Err,'*-')
% grid on
% xlabel('h');
% ylabel('errore');
% hold on
% loglog(H,H.^2)
% legend('Err','H','location','northwest')
