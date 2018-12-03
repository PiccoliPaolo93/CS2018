function [z,k,res] = myBisezioneMod(f,a,b,tol,kmax)
%	[z,k,res] = myBisezione(f,a,b,tol,kmax)
%   Algoritmo di bisezione

err=1;
k=0;
while err>tol && k<kmax
    c=(a+b)/2;
    err=(b-a)/2;
    y=f(c);
    if f(a)*y<0 %intervallo sinistra
        b=c;k=k+1;
    elseif f(b)*y<0 %intervallo destro
        a=c;k=k+1;
    else %c coincide con la radice
        err=0;
    end
end
k=k-1;
z=c;
res=f(z);
end

