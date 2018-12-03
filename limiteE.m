function limiteE(M)
%	limiteE(M)
%   valuto (1+1/n)^n

nn=logspace(1,M,10*M); %genero valori equispaziati in scala logaritmica
an=(1+1./nn).^nn;

semilogx(nn,an,'o');
hold on
plot([nn(1),nn(end)],[exp(1),exp(1)],'r--');
grid on
end

