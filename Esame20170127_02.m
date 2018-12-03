
A=[324 -45 246 -162 -9;...
    -45 1048 442 96 113;...
    246 442 435 -183 30;...
    -162 96 -183 387 60;...
    -9 113 30 60 20];
b=[615;2736;1838;-360;247];

simm=A==A';
lambdas=eig(A);
posDef=lambdas>0;
if(length(A(simm))==length(b)^2 && length(lambdas(posDef))==length(b)) 
    fprintf('La matrice è simmetrica definita positiva\n');

    n=length(b);
    x0=rand(n,1);
    kmax=500;
    tol=1e-14;

    [x1,k1,res1,resv1]=gradiente(A,b,x0,kmax,tol);
    [x2,k2,res2,resv2]=gradienteCon(A,b,x0,kmax,tol);
    figure(1); clf
    semilogy(resv1);
    hold on
    semilogy(resv2);
    grid on
    xlabel('iterazione')
    ylabel('residuo')
    legend('gradiente','gradiente coniugato')
    
    KA=cond(A)
    rho=(KA-1)/(KA+1)
    
    k2
    % abbiamo più iterazioni rispetto alla dimensione del sistema in quanto
    % la matrice è mal condizionata e quindi questo influisce sugli errori
    % di arrotondamento
    stima=KA*eps/2
else
    warning('La matrice non è simmetrica definita positiva')
end