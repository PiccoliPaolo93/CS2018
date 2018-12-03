function calcoloDiUnIntegrale(N)
%   calcoloDiUnIntegrale(N)
%   Calcolo di x^n/(x+5)
I=zeros(N+1,1);
I(1)=log(6/5);
for n=1:N
    I(n+1)=1/n-5*I(n);
end
figure(1); clf
semilogy(0:N,abs(I),'o');
grid on
end

