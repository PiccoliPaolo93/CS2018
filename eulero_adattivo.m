function [tn ,un]= eulero_adattivo(odefun ,tspan ,y0,epsilon ,hmin)
%   [tn ,un]= eulero_adattivo(odefun ,tspan ,y0,epsilon ,hmin)
%   calcolo della soluzione tramite eulero adattivo
    
    y0=y0(:);
    h=(tspan(2)-tspan (1))/10;
    tn=tspan (1);
    % memorizzo il tempo t_0
    un=y0;
    % memorizzo la soluzione al tempo t_0
    t=tn(1); w=un(1);
    % variabili che servono  nel ciclo successivo
    while t< tspan (2)
        % ciclo sul tempo
        [t1 ,un1]= eulero_esp(odefun ,[t,t+h],w,1) ;
        % un passo di ampiezza h
        [t2 ,un2]= eulero_esp(odefun ,[t,t+h],w,2);
        % due passi di ampiezza h/2
        w1=un1(end); w2=un2(end);
        stima=abs(w1-w2);
        if  stima  <= 0.5*  norm(un ,inf) * epsilon  || h< hmin
            % accetto h e w2 e raddoppio h per il prossimo passo
            tn=[tn;t+h]; un=[un; w2]; h=h*2;
            t=tn(end); w=un(end);
        else
            h=h/2 ;
            % si rimane fermi a t_n e si riprova
        end
    end
end