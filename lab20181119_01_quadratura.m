%test di pmedioc

f=@(x)x;
a=1;b=2;M=3;
Ipm=midpointc(f,a,b,M)


%%

f=@(x)exp(x);
a=1;b=2;
Iex=exp(2)-exp(1);
Err=[];
for M=10:10:100
    Ipm=midpointc(f,a,b,M)
    Err=[Err; abs(Iex-Ipm)];
end

H=(b-a)./(10:10:100);
figure(1); clf
loglog(H,Err,H,H.^2);
legend('err','H^2','location','northwest');
grid on
