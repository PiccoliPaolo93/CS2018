close all

f=@(x)sin(x-1)-0.5*sin(2*(x-1));
df=@(x)cos(x-1)-cos(2*(x-1));

tol=1.e-8;
kmax=100;

figure(1); clf
fplot(f, [-3 3]);
grid on

[z,res,its,ERRs]=myNewton(f,df,-2,tol,kmax);
%disp('Radice di sinistra');
fprintf('Newton: \tz=%f, res=%f, k=%d\n',z,res,its);
hold on
plot(z,res,'ro');

[z,res,itd,ERRd]=myNewton(f,df,2,tol,kmax);
fprintf('Newton: \tz=%f, res=%f, k=%d\n',z,res,itd);
hold on
plot(z,res,'ro');

[z,res,its2,ERRs2]=mySecanti(f,-2, -1, tol, kmax);
fprintf('Secanti: \tz=%f, res=%f, k=%d\n',z,res,its2);
hold on
plot(z,res,'y*');

[z,res,itd2,ERRd2]=mySecanti(f, 1.5, 2, tol, kmax);
fprintf('Secanti: \tz=%f, res=%f, k=%d\n',z,res,itd2);
hold on
plot(z,res,'y*');

figure(2); clf
semilogy((0:its)',ERRs,'b*-',(0:itd)',ERRd,'ro-');
title('Errore Newton');
grid on
xlabel('k'); ylabel('errori');

figure(3); clf
semilogy((0:its2)',ERRs2,'b*-',(0:itd2)',ERRd2,'ro-');
title('Errore Secanti');
grid on
xlabel('k'); ylabel('errori');

