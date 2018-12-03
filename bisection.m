function [zero,res,niter]=bisection(fun,a,b,tol,...
                                     nmax,varargin)
%BISECTION Trova uno zero di una funzione.
%   zero=bisection(fun,a,b,tol,nmax) approssima uno
%   zero della funzione FUN nell'intervallo [A,B] con
%   il metodo di bisezione.  FUN deve essere definita
%   su variabile vettoriale.
%   Se la ricerca dello zero di FUN fallisce, il
%   programma restituisce un messaggio d'errore.
%   FUN puo' essere una inline function, una anonymous
%   function od una function definita in un M-file.
%
%   zero=bisection(fun,a,b,tol,nmax,p1,p2,...) passa
%   i parametri P1, P2,... alla funzione
%   FUN(X,P1,P2,...).
%
%   [zero,res,niter]= bisection(fun,a,b,tol,nmax) restituisce
%   il valore del residuo RES in ZERO ed il numero di
%   iterazioni effettuate per calcolare il valore ZERO.
 zero=[]; res=[]; 
x = [a, (a+b)*0.5, b];
fx = fun(x,varargin{:});
if fx(1)*fx(3) > 0
   error(['Il metodo non puo` procedere, spiegare perche'' ']) 
%  error([' Il segno della funzione agli estremi',...
%  ' dell''intervallo [A,B] deve essere diverso']);
elseif fx(1) == 0
    zero = a; res = 0; niter = 0; return
elseif fx(3) == 0
    zero = b; res = 0; niter = 0; return
end
niter = 0;
I = (b - a)*0.5;
while I >= tol & niter < nmax
   niter = niter + 1;
   if fx(1)*fx(2) <  0
      x(3) = x(2);
      x(2) = x(1)+(x(3)-x(1))*0.5;
      fx = fun(x,varargin{:});
      I = (x(3)-x(1))*0.5;
   elseif fx(2)*fx(3) < 0
      x(1) = x(2);
      x(2) = x(1)+(x(3)-x(1))*0.5;
      fx = fun(x,varargin{:});
      I = (x(3)-x(1))*0.5;
   else  
       ind=find(fx==0);
       if ~isempty(ind)
       x(2) = x(ind); 
       I = 0;
       else
           warning('il metodo non puo` proseguire')
          
           return
       end
   end
end
if  (niter==nmax & I > tol)
 fprintf(['Il metodo di bisezione si e'' arrestato',...
 ' senza soddisfare la tolleranza richiesta\n',...
 'avendo raggiunto il numero massimo di iterazioni\n']);
end
zero = x(2);
x = x(2);
res = fun(x,varargin{:});
return
