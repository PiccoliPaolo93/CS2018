A=[0.8 0.1 0;0.1 6.1 0.7;0 0.7 58.1];
b=[0.9;6.9;58.8];

epsilon=1.e-3;
vett=[1;1;0];
bErr=b+epsilon*vett;
x=A\b
xErr=A\bErr

errDati=epsilon*norm(vett)/norm(b);
stimaErr=cond(A)*errDati

errSol=norm(x-xErr)/norm(x)

if (errSol<=stimaErr) 
    fprintf('Stima valida\n');
else
    fprintf('Stima errata\n');
end