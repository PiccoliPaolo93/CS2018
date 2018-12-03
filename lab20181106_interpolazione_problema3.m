%analisi errore interpolazione Lagrange globale
f=@(x)(x+2)/7.*cos(x);
xa=0; xb=6;

figure(1); clf

Err=[];

for n=1:10
    %definiksco i nodi di interpolazione (n+1)
    x=linspace(xa,xb,n+1);
    %valuto f nei nodi di interpolazione
    y=f(x);
    %x,y = dati dell'interpolazione
    x1=linspace(xa,xb,200);
    y1=barycentric(x,y,x1);
    yf1=f(x1);
    plot(x1,yf1);
    hold on
    plot(x1,y1);
    grid on
    hold off
    title(['n=',num2str(n)]);
    errore=max(abs(yf1-y1));
    Err=[Err;errore];
        pause(0.1);
end

%rappresento gli errori in scala semilogaritmica
figure(2); clf
semilogy((1:10), Err,'-o');
grid on
xlabel('n');
ylabel('Errore e_n');
title('Interpolazione globale su nodi equispaziati');

