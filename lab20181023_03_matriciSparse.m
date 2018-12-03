clear;
load west0479;
spy(west0479)
A=full(west0479);
whos

%%
clear;
n=20;
A=sparse(n)
whos
e=ones(n,1);
A=spdiags(e,0,n,n);
spy(A)
whos
A(1,:)=1;
A(:,1)=1;
spy(A)
whos

%cond(A)
%non usare cond su matrici sparse
cond(full(A))