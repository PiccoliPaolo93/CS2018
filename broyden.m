function [zero,res,niter,Err]=broyden(fun,B0,x0,varargin)
%BROYDEN Trova uno zero di un sistema di funzioni.
%   ZERO=BROYDEN(FUN,B0,X0,TOL,NMAX,PFLAG) approssima lo
%   zero ZERO del sistema di funzioni definite nella
%   function FUN, usando il metodo di Broyden
%   partendo da X0, dove B0 e' l'approssimazione
%   dello Jacobiano al passo 0. FUN accetta in ingresso
%   un vettore x e restituisce un vettore della stessa
%   dimensione. Se la ricerca dello zero fallisce, il
%   programma restituisce un messaggio d'errore.
%   FUN puo' essere una inline function, anonymous
%   function o function definita in M-file.
%   TOL e` la tolleranza per il test d'arresto e
%   NMAX e` il num. massimo di iterazioni.
%   se PFLAG =1 viene stampato messaggio di convergenza
%   [ZERO,RES,NITER]= BROYDEN(FUN,...) restituisce il
%   valore del residuo RES in ZERO ed il numero di
%   iterazioni NITER necessario per calcolare ZERO.
if nargin==3
    tol=1.e-8; nmax=50; pflag=1;
else 
    tol=varargin{1};
    nmax=varargin{2};
    pflag=varargin{3};
end
fx0 = fun(x0);
niter = 0; 
err = tol+1;
Err=[err];
while err >= tol && niter < nmax
s=-B0\fx0; 
x1=x0+s; 
fx1=fun(x1);
B0=B0+(fx1*s')/(s'*s);
niter = niter + 1; 
err = norm(s);
Err=[Err;err];
x0=x1; fx0=fx1;
end
zero = x1; res = norm(fx1);
if pflag
if (niter==nmax && err > tol)
  fprintf(['Broyden si e'' arrestato senza aver ',...
   'soddisfatto l''accuratezza richiesta, avendo\n',...
   'raggiunto il massimo numero di iterazioni\n']);
else
    fprintf(['Il metodo converge in %i iterazioni',...
            ' con un residuo pari a %e\n'],niter,res);
end
end
return
