function [tt,u]=rk2(odefun,tspan,y0,Nh,varargin);
%RK2  Risolve equazioni differenziali
%   usando il metodo di Runge-Kutta2 esplicito.
%   [tn,un] = rk2(odefun,tspan,y0,Nh) con
%   TSPAN = [T0,TF] integra il sistema di equazioni
%   differenziali y' = f(t,y) dal tempo T0 a TF con
%   condizione iniziale Y0 usando il metodo di 
%   Runge-Kutta2 esplicito su una griglia equispaziata di 
%   Nh intervalli.
%   La funzione ODEFUN(T,Y) deve ritornare un vettore
%   contenente f(t,y), della stessa dimensione di y.
%   Ogni riga del vettore soluzione Y corrisponde ad
%   un istante temporale del vettore colonna T.
%   [T,Y] = RK2(ODEFUN,TSPAN,Y0,NH,P1,P2,...) passa
%   i parametri addizionali P1,P2,... alla funzione
%   ODEFUN come ODEFUN(T,Y,P1,P2...).

tt=linspace(tspan(1),tspan(2),Nh+1);
h=(tspan(2)-tspan(1))/Nh; hh=h*0.5; 
y=y0(:);
w=y; u=y.';
for t=tt(1:end-1)
  
  k1=feval(odefun,t,w,varargin{:});
  t1 = t + h; w1 = w + h* k1;
  k2=feval(odefun,t1,w1,varargin{:});
  w=w + hh*(k1+k2);
  u = [u; w.'];

end
tt=tt';
