function [A,b] = myMegPivot(A,b,n,k)
%	[A,b] = myMegPivot(A,b)
%   Cerca la riga di pivot per il metodo MEG, la scambia e restituisce le
%   due matrici

    [y,I]=max(A(k:n,k));
    index=I+k-1;
    A=mySwapRows(A,k,index);
    b=mySwapRows(b,k,index);
end

