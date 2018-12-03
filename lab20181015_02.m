A=[10 4 3 -2;2 20 20 -1;3 -6 4 3;-3 0 3 1];
b=[5;24;13;-2];

x=meg(A,b) %meg senza pivot
xm=A\b %metodo implementato in matlab
xmod=megMod(A,b) %meg con pivot fatto da me
xpivot=meg_pivot(A,b) %meg con pivot fatto in classe
