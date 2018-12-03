function [z,k,res] = myBisezione(f,a,b,tol,kmax)
%	[z,k,res] = myBisezione(f,a,b,tol,kmax)
%   Algoritmo di bisezione

err=1;
k=0;
while err>tol && k<kmax
    c=(a+b)/2;
    err=(b-a)/2;
    y=f(c);
    if abs(y)<tol
        err=0;
    else
    if f(a)*y<0
        b=c;
    else
        a=c;
    end
    k=k+1;
    end
end
z=c;
res=f(z);
end

