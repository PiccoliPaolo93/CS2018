% a(1)=1/3; a(2)=2/3;
% b(1)=11/6; b(2)=-1/6;
% condizioni consistenza
% c1=sum(a);
% c2=0; %todo
% 
% condizioni zero stabilità
%3r^2-r-2=0
%r1,2=1, -2/3
%metodo zero stabile
% il metodo è convergente

odefun=@(t,y)-(y-3).^2;
tspan=[0,5];
y0=4;
yex=@(t)3+1./(t+1);

H=[0.1,0.01,0.001];
Err=[];

for h=H
    Nh=fix((tspan(2)-tspan(1))/h);
    [tn,un]=multistep(odefun,tspan,y0,Nh);
    % valuto la sol esatta sui tn
    yn=yex(tn);
    err=max(abs(yn-un));
    Err=[Err,err];
    figure(1); clf
    plot(tn,un,'.--');
    title(['h=',num2str(h)]);
    hold on
    plot(tn,yn);
    xlabel('t');
    legend('sol numerica','sol esatta');
    pause;
end

%% rappresento gli errori
figure(2); clf
loglog(H,Err);
hold on
loglog(H,H.^2);
grid on
xlabel('h'); ylabel('errori');
legend('err','H^2','location','northwest')
