function [R] = myCholeski(A)
%	[R] = myCholeski(A)
%   Fattorizzazione con il metodo di Choleski
    [n,m]=size(A);
    if (n==m)
        R=zeros(n);
        R(1,1)=sqrt(A(1,1));
        for j=2:n
            for i=1:j-1
                sum=0;
                for k=1:i-1
                    sum=sum+R(k,i)*R(k,j);
                end
                R(i,j)=(A(i,j)-sum)/R(i,i);
            end
            sum=0;
            for k=1:j-1
                sum=sum+(R(k,j)^2);
            end
            R(j,j)=sqrt(A(j,j)-sum);
        end
    else
        warning('Matrice non quadrata')
    end
end

