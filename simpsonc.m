function [Isc] = simpsonc(f,a,b,M)
%	[Isc] = simpsonc(f,a,b,M)
%   Isc is the integral computed with the Simpson Composite algorithm
    H=(b-a)/M; % ampiezza degli intervalli
    x=linspace(a,b,M+1);
    Isc=0;
    for k=1:M
        pmk=(x(k)+x(k+1))/2; % punto medio
        Isc=Isc+f(x(k))+4*f(pmk)+f(x(k+1));
    end
    Isc=Isc*H/6;
end
