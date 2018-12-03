function [alpha,it,ERR] = myPFisso(phi, x0, tol, kmax)
%	[alpha,it,ERR] = myPFisso(phi, x0, tol, kmax)
%   

x=x0;
err=1;
k=0;
ERR=[err];
while k<kmax && err>tol
   xnew=phi(x);
   err=norm(xnew-x); %norma euclidea
   ERR=[ERR;err];
   k=k+1;
   x=xnew;
end
alpha=x;
it=k;
end

