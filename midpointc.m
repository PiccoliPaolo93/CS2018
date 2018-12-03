function [Imp] = midpointc(f,a,b,M)
%	[Imp] = midpointc(f,a,b,M)
%   Formula di quadratura con punto medio composito
    
    Imp=0;
    H=abs(b-a)/M;
    x=linspace(a,b,M+1);
    
    for i=1:M
        mp=(x(i)+x(i+1))/2;
        Imp=Imp+(x(i+1)-x(i)).*f(mp);
    end
end

