function [tt,u]=multistep(odefun,tspan,y0,Nh);
%MULTISTEP  Risolve equazioni differenziali
%   usando un metodo multistep
%   [tn,un] = multistep(odefun,tspan,y0,Nh) con
%   TSPAN = [T0,TF] integra il sistema di equazioni
%   differenziali y' = f(t,y) dal tempo T0 a TF con
%   condizione iniziale Y0 usando il metodo di 
%   multistep esplicito su una griglia equispaziata di 
%   Nh intervalli.
%   La funzione ODEFUN(T,Y) deve ritornare un vettore
%   contenente f(t,y), della stessa dimensione di y.
%   Ogni riga del vettore soluzione Y corrisponde ad
%   un istante temporale del vettore colonna T.

tt=linspace(tspan(1),tspan(2),Nh+1);
h=(tspan(2)-tspan(1))/Nh; 
y=y0(:);
w=y; u=y.';
terzo=1/3; dueterzi=2/3; h6=h/6;
hh=h*0.5;
% calcolo il secondo dato iniziale con RK4
t=tspan(1);
  k1=odefun(t,w);
  t1 = t + hh; w1 = w + hh* k1;
  k2=odefun(t1,w1);
  w1 = w + hh* k2;
  k3=odefun(t1,w1);
  t1 = t + h; w1 = w + h*k3;
  k4=odefun(t1,w1);
  w1=w + h6*(k1+2*k2+2*k3+k4);
u = [u; w1.'];
f0=k1;
f1=odefun(tt(2),w1);
% calcolo il passo generico
for t=tt(2:end-1)
  w_new= terzo*w1 + dueterzi*w + h6*(11*f1-f0);
  w=w1;
  w1=w_new;
  f0=f1;
  f1= odefun(t,w1);
  u = [u; w1.'];
end

tt=tt';

