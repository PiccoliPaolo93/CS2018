%definisco la funzione vettoriale
F=@(x)[x(1).^2-x(2).^2-1; 
       x(1).^2+x(2).^2-2*x(1)-3];

tol=1.e-14;
kmax=100;
B0=eye(2);

x0=[1;1];
[zero1,res1,it1,ERR1]=broyden(F,B0,x0,tol,kmax,1)

x0=[2;-1];
[zero2,res2,it2,ERR2]=broyden(F,B0,x0,tol,kmax,1)

x0=[-2;-1];
[zero3,res3,it3,ERR3]=broyden(F,B0,x0,tol,kmax,1)

figure(); clf
semilogy((0:it1)',ERR1,(0:it2)',ERR2,(0:it3)',ERR3)
grid on
legend(['radice ',num2str(zero1(1)),', ',num2str(zero1(2))],...
    ['radice ',num2str(zero2(1)),', ',num2str(zero2(2))],...
    ['radice ',num2str(zero3(1)),', ',num2str(zero3(2))]);
xlabel('k');
ylabel('errori');