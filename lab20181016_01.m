A=[1 1 3;2 2 2;3 6 4];
b=[5;6;13];

d=det(A)

x=meg(A,b) %meg senza pivot
xpivot=meg_pivot(A,b) %meg con pivot fatto in classe
xm=A\b %metodo implementato in matlab
