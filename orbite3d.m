 function orbite3d(tn,un)
% Uso: orbite3d(tn,un)
%
% Input: tn: vettore dei tempi, dimensione (N,1)
%        un: array contenente le tre componenti del vettore spostamento
%            dimension(N,3)
% Visualizza le traiettorie del punto
% materiale vincolato ad una sfera e soggetto ad una 
% forza esterna. 
%

xmin=-1.2;xmax=1.2;ymin=-1.2;ymax=1.2;zmin=-1.2;zmax=1.2;

    figNumber=figure( ...
        'Name','Traiettorie del sistema', ...
        'Visible','on');
    %colordef(figNumber,'white');
    axes('Units','normalized', ...
        'Position',[0.1 0.10 0.85 0.85], ...
        'Visible','on');

    set(gca, ...
        'XLim',[xmin xmax],'YLim',[ymin ymax],'ZLim',[zmin zmax], ...
        'XTickMode','auto','YTickMode','auto','ZTickMode','auto', ...
        'XGrid','on','YGrid','on','ZGrid','on', ...
        'Visible','on', ...
        'NextPlot','add', ...
        'View',[37.5,18]);
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
%    title(titolo);

[X,Y,Z]=sphere(40);
s1=mesh(X,Y,Z);hold on
set(s1,'FaceAlpha',0.3)

    lb = 20;
lt=10;
    l=length(tn);

    body = animatedline(un(1:lb,1),un(1:lb,2),un(1:lb,3), ...
        'color','r', ...
        'LineStyle','-', ...
        'LineWidth',2);
    tail=animatedline(un(1:lt,1),un(1:lt,2),un(1:lt,3), ...
        'color','k', ...
        'LineStyle','-', ...
        'LineWidth',2);
for j=lb:l-2
j1=j-lt;
% Update the plot

 addpoints(body,un(j:j+2,1),un(j:j+2,2),un(j:j+2,3))
 addpoints(tail,un(j1:j1+2,1),un(j1:j1+2,2),un(j1:j1+2,3))
 pause(0.001)

end
p3=plot3(un(:,1),un(:,2),un(:,3));
set(p3,'Linewidth',2,'color','k')
hold off
