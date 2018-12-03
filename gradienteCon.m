function [x,k,res,resv] = gradienteCon(A,b,x0,kmax,tol)
%	[x,k,res,resv] = gradienteCon(A,b,x0,kmax,tol)
%   metodo del gradiente per risolvere Ax=b
%   Input:  A=matrice sdp del sistema
%           b=termine noto
%           x0=vettore iniziale
%           kmax=numero massimo di iterazioni
%           tol=tolleranza per il test d'arresto
%   Output: x=soluzione del sistema
%           k=numero di iterazioni eseguite
%           res=norma del vettore del residuo
%           resv=vettore delle norme di tutti i residui normalizzati

    x=x0;
    r=b-A*x;
    d=r;
    k=0;
    err=tol+1;
    normab=norm(b);
    resv=[];
    while k<kmax && err>tol
        v=A*d;
        alpha=(d'*r)/(d'*v);
        x=x+alpha*d;
        r=r-alpha*v;
        beta=(v'*r)/(d'*v);
        d=r-beta*d;
        err=norm(r)/normab;
        resv=[resv;err];
        k=k+1;
    end
    res=norm(r);
end

