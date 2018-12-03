%definisco la funzione vettoriale
F=@(x)[x(1).^2-x(2).^2-1; 
       x(1).^2+x(2).^2-2*x(1)-3];

JF=@(x)[2*x(1), -2*x(2);
        2*x(1)-2,   2*x(2)];

x0=[1;1];
tol=1.e-14;
kmax=100;

[zero1,res1,it1,ERR1]=myNewtonSys(F,JF,x0,tol,kmax)

x0=[2;-1];
[zero2,res2,it2,ERR2]=myNewtonSys(F,JF,x0,tol,kmax)

x0=[-1;-1];
[zero3,res3,it3,ERR3]=myNewtonSys(F,JF,x0,tol,kmax)

figure(); clf
semilogy((0:it1)',ERR1,(0:it2)',ERR2,(0:it3)',ERR3)
grid on
legend('prima radice','seconda radice','terza radice');
xlabel('k');
ylabel('errori');