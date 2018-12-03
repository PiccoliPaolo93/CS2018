function [isa,nodi] = simpad(f,a,b,tol,hmin)
%	[isa,nodi] = simpad(f,alpha,beta,tol,hmin)
%   Adaptive Simpson algorithm 

    alpha=a;
    beta=b;
    isa=0;
    nodi=[];
    while (beta-alpha)>0
        I1=simpsonc(f,alpha,beta,1);
        I2=simpsonc(f,alpha,beta,2);
        stim=abs(I1-I2)/15;
        if stim>(tol/2)*((beta-alpha)/(b-a)) && (beta-alpha)>hmin
            beta=(beta+alpha)/2;
        else
            isa=isa+I2;
            nodi=[nodi,linspace(alpha,beta,5)];
            alpha=beta;
            beta=b;
        end
    end
    nodi=(unique(nodi))';
end

