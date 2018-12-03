function [z,res,it,ERR] = myNewton(f,df, x0, tol, kmax)
%	[zero res k ERR] = myNewton(f,df, x0, tol, kmax)
%   Calcolo della radice con il metodo di Newton

x=x0;
err=1;
k=0;
ERR=[err];
while k<kmax && err>tol
   xnew=x-f(x)/df(x); %iterata di Newton
   err=abs(xnew-x); %aggiorno errore
   ERR=[ERR;err]; %aggiungo in coda l'ultimo errore
   k=k+1; %aggiorno contatore
   x=xnew;%aggiorno x
end
z=x;
res=f(x);
it=k;
end

