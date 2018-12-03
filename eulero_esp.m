function [tn,un] = eulero_esp(odefun,tspan,y0,Nh)
%	[tn,un] = eulero_esp(odefun,tspan,y0,Nh)
%   Metodo di Eulero esplicito
%   odefun: espressione della f
%   tsapn=[t0,T] inizio e fine intervallo
%   y0: condizione iniziale
%   Nh: numero di passi temporali

    tn=linspace(tspan(1),tspan(2),Nh+1)';
    un=zeros(Nh+1,1);
    un(1)=y0;
    h=tn(2)-tn(1); %h=(tspan(2)-tspan(1))/Nh;
    
    for i=1:Nh
        un(i+1)=un(i)+h*odefun(tn(i),un(i));
    end
end

