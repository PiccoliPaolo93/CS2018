function fact = myFattoriale(n)
%	fact = myFattoriale(n)
%   Calcolo la mia versione del fattoriale
fact=0;
if mod(n,1)~=0 || n<0
    warning('Il fattoriale esiste solo per i numeri naturali');
elseif n==0 || n==1
    fact=1;
else
    for i=1:n
        fact=prod(2:n);
    end
end

