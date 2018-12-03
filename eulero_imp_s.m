function [tn,un]=eulero_imp_s(odefun,tspan,y0,Nh, varargin)
%   [tn,un]=eulero_imp_s(odefun,tspan,y0,Nh);
%   approssimazione del pdC del primo ordine con Eulero implicito
%   funziona sia per equazioni scalari che vettoriali, 
%   il sistema non lineare
%   e' risolta con il metodo di Broyden (da broyden.m)
%
%   tspan = [t0,T] integra il sistema di equazioni
%   differenziali y' = f(t,y) dal tempo t0 a T con
%   condizione iniziale y0 usando il metodo di Eulero
%   all'indietro su una griglia equispaziata di Nh
%   intervalli.
%   La funzione ODEFUN(T,Y) deve ritornare un vettore
%   contenente f(t,y), della stessa dimensione di y.
%   Ogni riga del vettore soluzione un corrisponde ad
%   un istante temporale del vettore colonna tn.
%   Nel caso siano assegnati solo 4 parametri di input,
%   la tolleranza e num.max di iterazioni per broyden
%   sono pari a tol=1.e-8; nmax=20;
%   Altrimenti
%   [tn,un]=eulero_imp_s(odefun,tspan,y0,Nh,tol,nmax)
%   specifica anche tol e nmax per broyden.

% se il numero di argomenti e' 4, setto di default tol e nmax per broyden
if nargin == 4
tol=1.e-8;nmax=20;pflag=0;
else
    tol=varargin{1};
    nmax=varargin{2};
    pflag=0;
end

t0=tspan(1);
T=tspan(2);
tn=linspace(t0,T,Nh+1)';
% calcolo h
h=(T-t0)/Nh;


y0=y0(:); % y0 sara' sempre vettore colonna
d=length(y0); % d= num. di eqz del sistema

% costruisco il vettore della soluzione numerica
un=zeros(Nh+1,d);

un(1,:)=y0.'; % .' realizza la trasposta sia che la variabile sia reale,
%                    sia che la variabile sia complessa

B0=eye(d);
% n=1: calcolo u_(n+1)
n=1;
w=un(1,:)';
F=@(x)x-w-h*odefun(tn(n+1),x);
[w1]=broyden(F,B0,w,tol,nmax,pflag);
un(2,:)=w1.';

for n=2:Nh
    w=un(n,:).';
    F=@(x)x-w-h*odefun(tn(n+1),x);
    [w1]=broyden(F,B0,w,tol,nmax,pflag);
    un(n+1,:)=w1.';
end


