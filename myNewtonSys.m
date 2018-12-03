function [zero,res,it,ERR] = myNewtonSys(F,JF,x0,tol,kmax)
%	[zero,res,it,ERR] = myNewtonSys(F,JF,x0,tol,kmax)
%   Newton per sistemi

    x=x0;
    err=1;
    ERR=[err];
    k=0;
    while err>tol && k<kmax
        A=JF(x); %valuto lo Jacobiano nel punto x
        b=-F(x); %valuto -F nel punto x(k)
        z=A\b; %sto risolvendo Az=b
        xnew=z+x; %nuova iterata
        err=norm(z); % ||x^(k+1)-x^(k)||
        ERR=[ERR;err];
        x=xnew;
        k=k+1;
    end
    zero=x;
    res=F(zero);
    it=k;
end

