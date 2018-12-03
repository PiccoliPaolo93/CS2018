eta=[10; 5; 30; 25; 45; 6; 15; 35];
dist=[3; 9; 4; 10; 6; 12; 7; 16];
prezzo=[2300; 2000; 1800; 1700; 1550; 1800; 2200; 1450];

%matrice X del sistema rettangolare
N=length(eta);
X=[eta, dist, ones(N,1)];
%matrice dei termini noti
Y=prezzo;
%calcolo vettore a^* risolvendo le Normal Equations
as=X\Y;

%grafica
figure(1); clf
plot3(eta,dist,prezzo,'o');
hold on
grid on
xlabel('eta');
ylabel('distanza');
zlabel('prezzo');
x1v=linspace(min(eta),max(eta),10);
x2v=linspace(min(dist),max(dist),10);
[x1,x2]=meshgrid(x1v,x2v);
z=as(1)*x1+as(2)*x2+as(3);
mesh(x1,x2,z);

%stima
xs=23; %eta 
ys=5; %distanza
ps=as(1)*xs+as(2)*ys+as(3); %prezzo stimato
plot3(xs,ys,ps,'s');

residuo=Y-X*as