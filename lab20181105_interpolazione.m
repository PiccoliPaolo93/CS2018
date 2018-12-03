x=[2.00 4.25 5.25 7.81 9.20 10.60]';
y=[7.2 7.1 6.0 5.0 3.5 5.0]';

figure(1); clf
ph(1)=plot(x,y,'o');
leg{1}='dati';  %aggiorna la legenda
                %leg è una struttura
grid on
xlabel('x');
ylabel('y');
hold on

%costruisco polinomio di Lagrange globale
X=vander(x);
a=X\y; %vettore coeff polinomio
%definiamo vettore ascisse più fitto dei nodi dati
x1=linspace(x(1),x(end),100);
%valuto il polinomio in questi nodi
y1=polyval(a,x1);
ph(2)=plot(x1,y1);
leg{2}='polinomio di Lagrange';
legend(ph,leg);

%costruisco l'interpolatore composito lineare di Lagrange
%con interp1
y1c=interp1(x,y,x1);
ph(3)=plot(x1,y1c);
leg{3}='interpolazione composita di Lagrange';
legend(ph,leg);

%costruisco la spline
y1s=spline(x,y,x1);
ph(4)=plot(x1,y1s);
leg{4}='spline cubica';
legend(ph,leg);