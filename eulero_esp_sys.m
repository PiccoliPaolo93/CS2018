function [tn,un] = eulero_esp_sys(odefun,tspan,y0,Nh)
%	[tn,un] = eulero_esp_sys(odefun,tspan,y0,Nh)
%   Metodo di Eulero esplicito
%   odefun: espressione della f
%   tsapn=[t0,T] inizio e fine intervallo
%   y0: condizione iniziale
%   Nh: numero di passi temporali

    d=length(y0);   % recupero la dimensione del sistema
    y0=y0(:);       % y0 sarà un vettore colonna
    tn=linspace(tspan(1),tspan(2),Nh+1)';
    h=tn(2)-tn(1); %h=(tspan(2)-tspan(1))/Nh;
    
    un=zeros(Nh+1,d);   % inizializzo latrice un con d colonne
    un(1,:)=y0.';     % salvo la condizione iniziale in prima riga
    % .' è il trasposto algebrico anche per variabili complesse
    
    for n=1:Nh
        wn=un(n,:).';   % prendo un al tempo tn e traspongo
        w=wn+h*odefun(tn(n),wn);    % passo di eulero esplicito
        un(n+1,:)=w.';  % salvo in matrice la soluzione calcolata
    end
end

