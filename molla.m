function molla(tn,un,nspire)
% molla(tn,un,nspire)
%   rappresentazione grafica del sistema
%   parete - molla - massa  
%
%     uso: molla(tn,un)
% 
%     Input: tn= vettore dei tempi
%            un= array con un vettore colonna (o riga)
%                contenente la posizioni della massa ai tempi tn. 
%
[n1,n2]=size(un);
if n1>n2
    un=un.';
end

% preparo le variabili 
xmin=min(min(un(1:n2,:)));xmax=max(max(un(1:n2,:))); xr=(xmax-xmin)/5;
ymin=-1;ymax=1; yr=0;
xmin=xmin-xr; xmax=xmax+xr;
ymin=ymin-yr; ymax=ymax+yr;

    fig=figure( ...
        'Name','Molla', ...
        'Visible','on');
    colordef(fig,'white');
    axes( ...
        'Units','normalized', ...
        'Visible','on');

    axis([-1 1 -1 1]);
    axHndl=gca;
    
%      aviobj = avifile('molla.avi')
     set(axHndl, ...
        'XLim',[xmin xmax],'YLim',[ymin ymax], ...
        'Visible','on', ...
        'NextPlot','add', ...
        'Xgrid','on','Ygrid','on',...
        'View',[0,90]);
    tempo=text('position',[1,0.6,0],...
            'String',[],...
            'Fontsize',14);
  l=length(tn); 
        
        parete=animatedline([0,0],[-0.5,0.5],...
            'color','k', ...
            'Linewidth',3);
        
      x1=linspace(0,un(1,1),nspire*2+4);
    y1=zeros(1,nspire*2+4);
    y1(3:2:end-2)=0.1;
    y1(4:2:end-3)=-0.1;
      
           molla1=animatedline(x1,y1,...
            'color','g', ...
            'Linewidth',2);
      
        massa1 = animatedline(un(1,1),0, ...
            'color','r', ...
            'Marker','s', ...
            'markersize',9, ...
            'markerfacecolor','r', ...
            'markeredgecolor','r');
        
         

for k=1:l
  
    x1=linspace(0,un(1,k),nspire*2+4);
    y1=zeros(1,nspire*2+4);
    y1(3:2:end-2)=0.1;
    y1(4:2:end-3)=-0.1;
    
    %y1=[0,0,.1,-.1,.1,-.1,.1,-.1,.1,0,0];
    set(tempo,'String',['t=',num2str(tn(k))]);
    clearpoints(massa1);
    clearpoints(molla1);
    addpoints(massa1,un(1,k),0);
     addpoints(molla1,x1,y1);
     drawnow update 
   pause(0.05)
end
% close(fig)
%        aviobj = close(aviobj);
