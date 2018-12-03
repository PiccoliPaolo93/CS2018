function [x] = meg(A,b)
%	[x] = MEG(A,b)
%   Metodo di Eliminazione di Gauss
    [n,m]=size(A);
    [nb,mb]=size(b);
    if (n==m && mb==1 && m==nb)
        % riduzione
        for k=1:n-1
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

