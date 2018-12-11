function [f] = fvinc(t,y)
%	[f] = fvinc(t,y)
%   Funzione per il psferico

    d=length(y);
    f=zeros(d,1);
    f(1:3)=y(4:6);
    m=1; g=-9.8;
    G=[0;0;m*g];
    gradphi=2*y(1:3);
    H=2*eye(3);
    alpha=(m*y(4:6)'*H*y(4:6)+G'*gradphi)/(gradphi'*gradphi);
    f(4:6)=(G-alpha*gradphi)/m;
end

