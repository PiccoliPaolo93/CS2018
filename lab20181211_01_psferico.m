% definizione dati
tspan=[0,10];
x0=[0;-1;0];
v0=[0.8;0;1.2];

y0=[x0;v0];

h=0.0025;
Nh=fix((tspan(2)-tspan(1))/h);
[tn,un]=eulero_esp_sys(@fvinc,tspan,y0,Nh);

x=un(end,1:3)
r=abs(x(1)^2+x(2)^2+x(3)^2-1)

figure(1); clf
[X,Y,Z]=sphere(40);
s1=mesh(X,Y,Z);hold on
set(s1,'FaceAlpha',0.3)
plot3(un(:,1),un(:,2),un(:,3))

orbite3d(tn,un);

%%

% definizione dati
tspan=[0,10];
x0=[0;-1;0];
v0=[0.8;0;1.2];

y0=[x0;v0];

%h=0.005;
%h=0.025;
h=0.0025;
Nh=fix((tspan(2)-tspan(1))/h);
[tn,un]=rk4(@fvinc,tspan,y0,Nh);

x=un(end,1:3)
r=abs(x(1)^2+x(2)^2+x(3)^2-1)

figure(3); clf
[X,Y,Z]=sphere(40);
s1=mesh(X,Y,Z);hold on
set(s1,'FaceAlpha',0.3)
plot3(un(:,1),un(:,2),un(:,3))

orbite3d(tn,un);

%%

% definizione dati
tspan=[0,10];
x0=[0;-1;0];
v0=[0.8;0;1.2];

y0=[x0;v0];

[tn,un]=ode45(@fvinc,tspan,y0);

x=un(end,1:3)
r=abs(x(1)^2+x(2)^2+x(3)^2-1)

figure(5); clf
[X,Y,Z]=sphere(40);
s1=mesh(X,Y,Z);hold on
set(s1,'FaceAlpha',0.3)
plot3(un(:,1),un(:,2),un(:,3))

orbite3d(tn,un);

%%

% definizione dati
tspan=[0,10];
x0=[0;-1;0];
v0=[0.8;0;1.2];

y0=[x0;v0];

h=0.005;
Nh=fix((tspan(2)-tspan(1))/h);
[tn,un]=ode23(@fvinc,tspan,y0);

figure(7); clf
[X,Y,Z]=sphere(40);
s1=mesh(X,Y,Z);hold on
set(s1,'FaceAlpha',0.3)
plot3(un(:,1),un(:,2),un(:,3))

orbite3d(tn,un);

%%

% definizione dati
tspan=[0,10];
x0=[0;-1;0];
v0=[0.8;0;1.2];

y0=[x0;v0];

options=odeset('RelTol',1.e-6);
[tn,un]=ode45(@fvinc,tspan,y0,options);

x=un(end,1:3)
r=abs(x(1)^2+x(2)^2+x(3)^2-1)

figure(9); clf
[X,Y,Z]=sphere(40);
s1=mesh(X,Y,Z);hold on
set(s1,'FaceAlpha',0.3)
plot3(un(:,1),un(:,2),un(:,3))

orbite3d(tn,un);

