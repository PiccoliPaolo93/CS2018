[x,y]=meshgrid(0:.01:2);
f=@(x,y)sin(x.*y*pi)+1;
z=f(x,y);

figure(1); clf
mesh(x,y,z)
xlabel('x')
ylabel('y')
colormap(jet)

%% costruiamo l'interpolatore P1
[x,y]=meshgrid(0:.4:2);    % genero la griglia su 6x6
f=@(x,y)sin(x.*y*pi)+1;
z=f(x,y);
% costruisco l'interpolato a partire da questi dati
tri=delaunay(x,y);  % genero la mesh di triangoli
trimesh(tri,x,y,z); % disegno la funzione sulla mesh

%% costruiamo l'interpolazione Q1
[x,y]=meshgrid(0:.4:2);    % genero la griglia su 6x6
f=@(x,y)sin(x.*y*pi)+1;
z=f(x,y);

[x1,y1]=meshgrid(0:0.05:2); % mesh più fitta
z1=interp2(x,y,z,x1,y1); % valori dell'interpolato
figure(2); clf
mesh(x1,y1,z1);
hold on
mesh(x,y,z,'edgecolor','k','facecolor','none')

%% costruiamo l'interpolazione spline 2d
[x,y]=meshgrid(0:.4:2);    % genero la griglia su 6x6
f=@(x,y)sin(x.*y*pi)+1;
z=f(x,y);

[x1,y1]=meshgrid(0:0.05:2); % mesh più fitta
z1=interp2(x,y,z,x1,y1,'spline'); % valori dell'interpolato
figure(2); clf
mesh(x1,y1,z1);
hold on
mesh(x,y,z,'edgecolor','k','facecolor','none')
