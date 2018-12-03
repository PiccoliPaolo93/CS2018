function [c] = prodotto_matrici(a,b)
%   [c] = prodotto_matrici(a,b)
%   calcolo il prodotto tra due matrici
[n,ma]=size(a);
[nb,p]=size(b);
if ma==nb
    m=ma;
    c=zeros(n,p);
    for i=1:n %ciclo sulle righe
        for j=1:p %ciclo sulle colonne
            for k=1:m
                c(i,j)=c(i,j)+a(i,k)*b(k,j);
            end
        end
    end
else
    warning('Le dimensioni interne delle matrici non coincidono');
    c=[];
end
