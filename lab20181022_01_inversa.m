%calcolo l'inversa
A=[10 4 3 -2;2 20 20 -1;3 -6 4 3;-3 0 3 1];

% fattorizzo a con pivotazione
[L,U,P]=lufact(A,1); % [L,U,P]=lu(A)
n=4;
X=zeros(n);
%ciclo sulle colonne della matrice X=A^{-1}

for j=1:n
    %definisco il termine noto e_j
    b=zeros(n,1);
    b(j)=1;
    
    % risolvo Ly=P*b
    y=forSub(L,P*b); %y=L\(P*b)
    %risolvo Ux=y
    x=backSub(U,y); %x=U\y
    % memorizzo x nella colonna j-sima di X
    X(:,j)=x;
end
