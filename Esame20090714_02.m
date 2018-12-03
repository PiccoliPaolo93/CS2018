inizioPlot=1.e-3;
f1=@(x)1/3*log(x/2)+x.^2;
f2=@(x)x.^2+x-2;
diff=@(x)1/3*log(x/2)+x.^2-(x.^2+x-2);
df=@(x)1/(3*x)-1;

%parte a
figure(1); clf
fplot(f1,[inizioPlot,3]);
hold on
fplot(f2,[inizioPlot,3]);
fplot(diff,[inizioPlot,3])
fplot(df,[inizioPlot,3])
grid on
axis([inizioPlot,3,-2,5]);
plot([0.005 2],[0 0],'r*');
legend('f1','f2','diff','derivate','radici');

%parte b
tol=1.e-8;
kmax=50;
a=1.6;
b=3.6;

iterazioniPreviste=log2((b-a)/tol)-1
[zBis,kBis,resBis]=myBisezioneMod(diff,a,b,tol,kmax)
[zBis2,kBis2,resBis2]=myBisezioneMod(diff,0.0001,1.5,tol,kmax)

%parte c
x0=0.01;
[zeroN,resN,kN,errN]=myNewton(diff,df,x0,tol,kmax)

x0=3;
[zeroN2,resN2,kN2,errN2]=myNewton(diff,df,x0,tol,kmax)
