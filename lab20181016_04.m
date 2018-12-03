n=5;
A=rand(n);
d=det(A)

X=zeros(n);
B=eye(n);
[L,U,P]=lufact(A,1);
for i=1:n
    X(:,i)=backSub(U,forSub(L,P*B(:,i)));
end
A
X
verify=A*X