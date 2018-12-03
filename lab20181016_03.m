A=[1 1+0.5e-15 3;2 2 20;3 6 4];
b=[5+0.5e-15;24;13];

[L0,U0,P0]=lufact(A,0);
y=forSub(L0,P0*b);
x=backSub(U0,y)

L0
U0
P0 % se P è la matrice identità, non abbiamo avuto operazioni di pivoting

[L1,U1,P1]=lufact(A,1);
y=forSub(L1,P1*b);
x=backSub(U1,y)

L1
U1
P1 % se P è la matrice identità, non abbiamo avuto operazioni di pivoting