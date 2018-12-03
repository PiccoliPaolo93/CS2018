function [new] = mySwapRows(A,i,j)
%	[new] = mySwapRows(A,i,j)
%   Swap row i and j in the A matrix
    
    [n,m]=size(A);
    if n>=i && n>=j && i>0 && j>0
        new=A;
        new([i j],:) = A([j i],:);
    else
        new=[];
        warning('La matrice non ha le righe che hai indicato. Swap non eseguito')
    end
end

