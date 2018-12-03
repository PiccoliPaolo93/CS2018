R=0.055;
rhob=0.6;
f=@(x)x.^3-3*x.^2*R+4*R^3*rhob;

figure(1); clf
fplot(f,[-0.1 0.2])
grid on

% Secanti
x0=0;
x1=0.05;
tol=1.e-8;
kmax=100;
[z,res,it]=mySecanti(f,x0, x1, tol,kmax);
fprintf('z=%f, res=%f, k=%d\n',z,res,it);
hold on
plot(z,res,'o');

%% Bisezione
%voglio calcolare la redice di f(x) compresa nell'intervallo [0,0.11]
%bisezione

%[z k res]=myBisezione(f,0,0.11,1.e-8,100)
fprintf('Bisezione\n');
[z,res,k]=bisection(f,0,0.11,1.e-8,100);
fprintf('z=%f, res=%f, k=%d\n',z,res,k);
%[z k res]=myBisezioneMod(f,0,0.11,1.e-8,100)
hold on
plot(z,res,'*');

%% calcolo la radice con Newton
df=@(x)3*x.^2-6*R*x;
x0=0.01;
tol=1.e-8;
kmax=100;
fprintf('Newton\n');
[z,res,it]=myNewton(f,df,x0,tol,kmax);
fprintf('z=%f, res=%f, k=%d\n',z,res,it);
hold on
plot(z,res,'o')

