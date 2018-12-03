function [L,U,P] = lufact(A,piv)
%	[L,U,P] = lufact(A,piv)
%   piv=0 se non voglio pivoting
%   piv=1 se voglio pivoting
    [n,m]=size(A);
    if (n==m)
        P=eye(n); %matrice per la pivotazione
        % riduzione
        for k=1:n-1
            if piv==1
                %~ indica che la variabile non ci interessa
                [~,r1]=max(abs(A(k:n,k))); %r1 è la posizione del max riferita a partire dalla posizione k
                r=r1+k-1; %riga da scambiare
                temp=(A(k,:)); A(k,:)=A(r,:); A(r,:)=temp;
                temp=(P(k,:)); P(k,:)=P(r,:); P(r,:)=temp;
            if r~=k
                fprintf('Ho scambiato la riga k=%d con la riga r=%d\n',k,r)
            end
            end %fine pivotazione
            % continuo con meg/LU
            for i=k+1:n
                A(i,k)=A(i,k)/A(k,k);
               for j=k+1:n
                  A(i,j)=A(i,j)-A(i,k)*A(k,j);
               end
            end
        end
        % salvo in L il triangolo inferiore di A con 1 sulla diagonale
        L=tril(A,-1)+eye(n); % estraggo il triangolo sotto la diagonale principale e sommo l'identità
        U=triu(A); % estraggo il trinagolo superiore inclusa la diagonale principale
    else
       L=[]; U=[]; P=[];
       warning('Errore nella dimensione degli input')
    end
end

