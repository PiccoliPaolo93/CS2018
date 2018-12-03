f=@(x)1./(1+x.^2);
xa=-5; xb=5;
figure(1); clf
Err1=[];
ErrS=[];
H=[];

for n=10:10:500
    x=linspace(xa,xb,n+1);
    y=f(x);
    x1=linspace(xa,xb,1000);
    y1=interp1(x,y,x1);
    ys=spline(x,y,x1);
    yf1=f(x1);
    if n<=100
        plot(x1,yf1);
        hold on
        plot(x1,y1);
        grid on
        hold off
        title(['n=',num2str(n)]);
        pause(0.1)
    end
    H=[H;(xb-xa)/n];
    errore=max(abs(yf1-y1)); %scende come H.^2 quando H tende a zero
    Err1=[Err1;errore];
    errore=max(abs(yf1-ys));
    ErrS=[ErrS;errore];
end

figure(2); clf
loglog(H, Err1,'-o',H, ErrS,'-*');
hold on
loglog(H,H.^2,H,H.^4);
grid on
xlabel('H');
ylabel('Err');
title('Interpolazione Composita Lineare su nodi equispaziati');
