f=@(x)1./(1+(x-pi).^2);
g=@(x)sqrt(x);
a=0;
b=5;
Iexf=2.33976628367;
Iexg=2/3*5^(3/2);

Errf=[];
Errg=[];
M=10:10:1000;
for m=M
    %calcolo l'integrale con punto medio composito e m intervallini
    Ipmcf=midpointc(f,a,b,m);
    Ipmcg=midpointc(g,a,b,m);
    %fprintf('m=%d Ipmc(f)=%13.6e Ipmc(g)=13.63\n',m,Ipmcf,Ipmcg);
    Errf=[Errf;abs(Iexf-Ipmcf)];
    Errg=[Errg;abs(Iexg-Ipmcg)];
end

H=(b-a)./M;

figure(1); clf
loglog(H,Errf,'b+-',H,Errg,'ro-',H,H.^2,'g')
grid on
legend('Errore su f','Errore su g','H^2','location','northwest')
