phi1=@(x)-0.25*x.^2+x+0.5;
phi2=@(x)-x.^2+x+2;
phi3=@(x)0.5*x+1/x;

tol=1.e-12;
kmax=50;
x0=1;

[alpha1,it1,err1]=myPFisso(phi1, x0, tol, kmax);
[alpha2,it2,err2]=myPFisso(phi2, x0, tol, kmax);
[alpha3,it3,err3]=myPFisso(phi3, x0, tol, kmax);

figure(1); clf
semilogy([0:it1],err1,[0:it2],err2,[0:it3],err3);
grid on
xlabel('k');
ylabel('errori');
legend('phi1','phi2','phi3');

figure(2); clf
fplot(phi1,[0,2])
hold on
fplot(phi2,[0,2])
fplot(phi3,[0,2])
grid on
fplot(@(x)x,[0,2])
fplot(@(x)-x+2*sqrt(2),[0,2])
axis([0,2,0,2])
legend('phi1','phi2','phi3');
