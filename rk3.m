function [tt,u]=rk3(odefun,tspan,y0,Nh,varargin);
%RK3  Risolve equazioni differenziali
%   usando il metodo di Runge-Kutta3 esplicito.
%   [tn,un] = rk3(odefun,tspan,y0,Nh) con
%   TSPAN = [T0,TF] integra il sistema di equazioni
%   differenziali y' = f(t,y) dal tempo T0 a TF con
%   condizione iniziale Y0 usando il metodo di 
%   Runge-Kutta3 esplicito su una griglia equispaziata di 
%   Nh intervalli.
%   La funzione ODEFUN(T,Y) deve ritornare un vettore
%   contenente f(t,y), della stessa dimensione di y.
%   Ogni riga del vettore soluzione Y corrisponde ad
%   un istante temporale del vettore colonna T.
%   [T,Y] = RK3(ODEFUN,TSPAN,Y0,NH,P1,P2,...) passa
%   i parametri addizionali P1,P2,... alla funzione
%   ODEFUN come ODEFUN(T,Y,P1,P2...).

tt=linspace(tspan(1),tspan(2),Nh+1);
h=(tspan(2)-tspan(1))/Nh; hh=h*0.5; 
y=y0(:);
w=y; u=y.';
h6=h/6;
for t=tt(1:end-1)
  
  k1=feval(odefun,t,w,varargin{:});
  t1 = t + hh; w1 = w + hh* k1;
  k2=feval(odefun,t1,w1,varargin{:});
  t1 = t + h; w1 = w + h*(2*k2-k1);
  k3=feval(odefun,t1,w1,varargin{:});
  w=w + h6*(k1+4*k2+k3);
  u = [u; w.'];

end
tt=tt';
