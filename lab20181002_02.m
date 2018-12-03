f1=@(x1,x2)x1.^2-x2.^2-1;
f2=@(x1,x2)x1.^2+x2.^2-2*x1-3;

[x1,x2]=meshgrid(-3:.1:3); %scrivo un solo argomento perché voglio un quadrato

z_f1=f1(x1,x2);
z_f2=f2(x1,x2);

figure(1); clf
meshc(x1,x2,z_f1);
grid
xlabel('x1'); ylabel('x2'); title('f1');

hold on
contour(x1,x2,z_f1,[0 0], 'b', 'linewidth',2);


figure(2); clf
meshc(x1,x2,z_f2);
grid
xlabel('x1'); ylabel('x2'); title('f2');

hold on
contour(x1,x2,z_f2,[0 0], 'r', 'linewidth',2);

figure(3); clf
contour(x1,x2,z_f1,[0 0], 'b', 'linewidth',2);
hold on
contour(x1,x2,z_f2,[0 0], 'r', 'linewidth',2);
grid on
axis equal

