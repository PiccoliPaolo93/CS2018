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

H=[0.1,0.01,0.001];

for h=H

    Nh=fix((T-t0)/h);

    [tn,un]=eulero_esp(odefun,tspan,y0,Nh);
    plot(tn,un,'.--','MarkerSize',20);
    % definisco vettore valori esatti in tn
    yn=yex(tn);
    err=max(abs(yn-un));
    Err=[Err;err];
end

Err

legend('Esatta','0.5','0.25','0.125','location','northwest')

figure(2); clf
loglog(H,Err,'*-')
grid on
xlabel('h');
ylabel('errore');
hold on
loglog(H,H)
