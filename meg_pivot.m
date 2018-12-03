function [x] = meg_pivot(A,b)
%	[x] = MEG(A,b)
%   Metodo di Eliminazione di Gauss
    [n,m]=size(A);
    [nb,mb]=size(b);
    if (n==m && mb==1 && m==nb)
        % riduzione
        for k=1:n-1
            %~ indica che la variabile non ci interessa
            [~,r1]=max(abs(A(k:n,k))); %r1 è la posizione del max riferita a partire dalla posizione k
            r=r1+k-1; %riga da scambiare
            temp=(A(k,:));
            A(k,:)=A(r,:);
            A(r,:)=temp;
            temp=b(k); b(k)=b(r); b(r)=temp;
            if r~=k
                fprintf('Ho scambiato la riga k=%d con la riga r=%d\n',k,r)
            end
            for i=k+1:n
                l=A(i,k)/A(k,k);
               for j=k+1:n
                  A(i,j)=A(i,j)-l*A(k,j);
               end
               b(i)=b(i)-l*b(k);
            end
        end
        U=triu(A);
        x=backSub(U,b);
    else
       x=[];
       warning('Errore nella dimensione degli input')
    end
end

