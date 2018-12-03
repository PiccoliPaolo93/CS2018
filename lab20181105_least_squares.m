n=[10000:10000:50000];
T=[0.31 0.95 2.45 4.1 6.46];

%calcolo vettore coefficienti parabola
a=polyfit(n,T,2);

figure (1); clf
plot(n,T,'o');
grid on
hold on
%costruisco vettore di ascisse
n1=linspace(10000,50000,100)';
%valuto il polinomio p2 nelle ascisse n1
T1=polyval(a,n1);
plot(n1,T1);

%stimare il tempo per un nuovvettore di 55218 elementi
ns=55218;
Ts=polyval(a,ns);
plot(ns,Ts,'s')

legend('dati','parabola Least Squares', 'nuovo vettore');