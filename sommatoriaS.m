function s=sommatoriaS(n)
%   sum=sommatoriaS(n)
%   calcolo dei primi n valori
s=0;
for i=n:-1:1
    s=s+(1/i);
end
%fprintf('La sommatoria è %f\n', s)
fprintf('La sommatoria è %13.6e\n', s)