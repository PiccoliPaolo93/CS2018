f=@(x)sin(x);
a=0;
b=pi;
Err=[];
Iex=2;
for M=2:2:20
    Isc=simpsonc(f,a,b,M);
    %fprintf('L"integrale calcolato vale: %f\n',Isc)
    fprintf('M=%d Isc=%13.6e\n',M,Isc)
    err=abs(Isc-Iex);
    Err=[Err;err];
end

H=(b-a)./(2:2:20);  % vettore degli H utilizzati
figure(1); clf
loglog(H,Err,H,H.^4)
grid on
xlabel('H');
ylabel('errore');
legend('Errori','H^4','Location','northwest');