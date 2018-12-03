function [x] = forSub(L,b)
%	[x] = forSub(L,b)
%   Metodo di sostituzione in avanti per sistemi triangolari inferiori
    [n,m]=size(L);
    [nb,mb]=size(b);
    if (n==m && mb==1 && m==nb)
        x=zeros(n,1);
        for i=1:n
            x(i)=(b(i)-L(i,1:i-1)*x(1:i-1))/L(i,i);
        end
    else
        x=[];
        warning('Errore nelle dimensioni degli input')
    end
end

