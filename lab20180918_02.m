%chiudo tutte le figure aperte
close all;

[x,y]=meshgrid(-2:.1:2,-2:.1:2);

f=@(x,y)[x.*exp(-x.^2-y.^2)];
z=f(x,y);

figure(1);
clf
subplot(2,2,1);
mesh(x,y,z);
subplot(2,2,2);
surf(x,y,z);
subplot(2,2,3);
surf(x,y,z,gradient(z))
%surfc(x,y,z);
subplot(2,2,4);
%contour(x,y,z);
contour(x,y,z,-1:.1:0)

xlabel('x')
ylabel('y')
zlabel('z')
title('Prima funzione in 3d')
colormap(jet)
%cambia il POV
%view([30,26])

colorbar