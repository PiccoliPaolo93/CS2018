%analisi errore interpolazione Lagrange globale
f=@(x)1./(1+x.^2);
xa=-5; xb=5;
N=10;
figure(1); clf
Err=[];

for n=1:N
    %definiksco i nodi di interpolazione (n+1)
    %x=linspace(xa,xb,n+1); sono equispaziati -> non bello
    %uso i nodi di chebyshev-Gauss-Lobatto
    x=(xb-xa)/2*(-cos(pi*(0:n)'/n))+(xb+xa)/2;
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
        pause(0.5);
end

%rappresento gli errori in scala semilogaritmica
figure(2); clf
semilogy((1:N), Err,'-o');
grid on
xlabel('n');
ylabel('Errore e_n');
title('Interpolazione globale su nodi equispaziati');

