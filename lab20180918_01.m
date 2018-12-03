%chiudo tutte le figure aperte
close all;
% creo l'asse x
x=linspace(-1,2,50);
%definisco gli handle delle funzioni
f=@(x)[(2*x-sqrt(2)).*sin(2*x)];
g=@(x)[exp(x).*cos(x)];
%valuto le due funzioni
yf=f(x);
yg=g(x);
%decido io la figura
figure(65536);
%pulisce la figura appena aperta
clf; 
%stampo il risultato
plot(x,yf,'b',x,yg,'r');
title('Rappresentazione di due funzioni')
xlabel('x')
ylabel('y')
legend('f(x)=(2x-sqrt(2))*sin(2x)','g(x)=exp(x)*cos(x)')
%per non cancellare il plot fatto prima e aggiugnere il nuovo
hold on
%attenzione a quello che fa fplot
h=@(x)[sqrt(x.^3+1)];
fplot(h,[-1,2])

hold off