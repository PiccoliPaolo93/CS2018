function successionePi(N)
%	successionePi(N)
%   Mostriamo l'errore nella successione con limite teorico PiGreco

f=zeros(N,1);
f(2)=2;
for n=2:N-1
    f(n+1)=2^(n-0.5)*sqrt(1-sqrt(1-4^(1-n)*(f(n)^2)));
end
plot(1:N,f,'o')
grid on
end

