n=6;
format rat
A=hilb(n)   %genero la matrice di Hilbert
format short
KA=cond(A)
lambda=eig(A);
x=ones(n,1);
b=A*x;  %costruisco in modo che la sol esatta di Ax=b 
                %sia il vettore con componenti tutte 1
format long e
xs=A\b
err=norm(x-xs)/norm(x)
%gli unici errori introdotti sono quelli di arrotondamento
%dell'ordine di u=unità di roundoff ~eps/2
% err<=K(A)*errSuiDati=K(A)*u

stima=KA*eps/2