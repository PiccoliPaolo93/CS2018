A=[1001 1001 0 0 0 0;
    1001 1001 1 0 0 0;
    0 1 1001 1001 0 0;
    0 0 1001 1001 1 0;
    0 0 0 1 1001 1001;
    0 0 0 0 1001 1001];

b=[2002;2003;2003;2003;2003;2002];

%non possiamo usare MEG senza pivotazione perché alla seconda riga compare
%un termine 0 al secondo elemento
% la sottomatrice delle prime due righe e prime due colonne è singolare

x=meg(A,b) %x è NaN

x=meg_pivot(A,b) %Arriviamo alla soluzione correttamente

x_esatta=ones(6,1);
errore=norm(x-x_esatta)/norm(x_esatta)

eig(A) %due autovalori negativi, non è detto che gradCon arrivi a convergenza

x0=rand(6,1);
kmax=20;
tol=1.e-14;

%[x,k,res,resv]=gradienteCon(A,b,x0,kmax,tol)
[x,flag,relres,iter,resv]=bicgstab(A,b,tol,kmax,[],[],x0)
figure(1); clf
semilogy(resv(1:2:end));
grid on
xlabel('iterazione')
ylabel('residuo')