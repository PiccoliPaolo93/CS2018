function [tn,un] = eulero_imp(odefun,tspan,y0,Nh,varargin)
%	[tn,un] = eulero_imp(odefun,tspan,y0,Nh,varargin)
%   Metodo di Eulero esplicito
%   odefun: espressione della f
%   tsapn=[t0,T] inizio e fine intervallo
%   y0: condizione iniziale
%   Nh: numero di passi temporali
%   varargin: 

    if nargin==4
        tol=1.e-8;
        kmax=20;
    elseif nargin==6
        tol=varargin{1};
        kmax=varargin{2};
    else
        warning('Attenzione al numero di input');
    end

    tn=linspace(tspan(1),tspan(2),Nh+1)';
    h=tn(2)-tn(1); %h=(tspan(2)-tspan(1))/Nh;
    un=zeros(Nh+1,1);
    un(1)=y0;
    n=1;
    g=@(x)x-un(n)-h*odefun(tn(n+1),x);
    
    un(n+1)=mySecanti(g,un(n),un(n)+h,tol,kmax);
    
    for n=2:Nh
        g=@(x)x-un(n)-h*odefun(tn(n+1),x);
        un(n+1)=mySecanti(g,un(n),un(n-1),tol,kmax);
    end
end

