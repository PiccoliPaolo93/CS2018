odefun=@(t,y)(-0.4+1i).*y;
tspan=[0,100];
y0=1;
%yex=@(t)3+1./(t+1);

H=linspace(0.6,0.64,10);
Err=[];

for h=H
    Nh=fix((tspan(2)-tspan(1))/h);
    [tn,un]=multistep(odefun,tspan,y0,Nh);
    % valuto la sol esatta sui tn
    %yn=yex(tn);
    %err=max(abs(yn-un));
    %Err=[Err,err];
    figure(1); clf
    subplot(2,1,1)
    plot(tn,real(un),'.--');
    grid on
    title(['h=',num2str(h)]);
    hold on
    %plot(tn,yn);
    xlabel('t');
    %legend('sol numerica','sol esatta');
    subplot(2,1,2)
    plot(tn,imag(un),'.--')
    grid on
    title(['h=',num2str(h)]);
    xlabel('t');
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
