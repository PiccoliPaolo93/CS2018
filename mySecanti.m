function [z,res,it,ERR] = mySecanti(f, x0, x1, tol, kmax)
%	[zero,res,k,ERR] = mySecanti(f, x0, x1, tol, kmax)
%   Calcolo della radice con il metodo di Newton

err=1;
k=0;
ERR=[err];
while k<kmax && err>tol
    ca=(f(x1)-f(x0))/(x1-x0);
    xnew=x1-f(x1)/ca;
    err=abs(xnew-x1);
    ERR=[ERR;err];
    k=k+1;
    x0=x1; %x(k-1) <-- x(k)
    x1=xnew; %x(k) <-- x(k+1)
end
z=xnew;
res=f(z);
it=k;
end

