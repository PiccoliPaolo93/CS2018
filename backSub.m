function [x] = backSub(U,b)
%	[x] = backSub(U,b)
%   Metodo di sostituzione all'indietro
    [n,m]=size(U);
    [nb,mb]=size(b);
    if (n==m && mb==1 && m==nb)
        x=zeros(n,1);
        for i=n:-1:1
            x(i)=(b(i)-U(i,i+1:n)*x(i+1:n))/U(i,i);
        end
    else
        x=[];
        warning('Errore nelle dimensioni degli input')
    end
end

