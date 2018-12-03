close all;
[r,theta]=meshgrid(0:.1:2,0:.1:6*pi);
x=r.*cos(theta);
y=r.*sin(theta);
z=theta;
surf(x,y,z)

xlabel('x')
ylabel('y')
zlabel('z')