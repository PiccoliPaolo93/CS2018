function [c] = somma_vettori(a,b)
%   [c] = somma_vettori(a,b)
%   calcolo c=a+b

%n=length(a); %calcolo la lunghezza del vettore
[na,ma]=size(a);
[nb,mb]=size(b);
if ma==1 && mb==1 && na==nb
    c=zeros(na,1); %genero c vettore colonna di n elementi
    for i=1:na
        c(i)=a(i)+b(i);
    end
    %c=c';
else
    warning('I vettori non hanno dimensioni compatibili')
    c=[];
end