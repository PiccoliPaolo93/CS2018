clear all;

load('MatriceB');
v=eig(B);
d=det(B);
r=rank(B);

v
fprintf('det(B)=%f, rango=%d\n',d,r);

p=1;
for i=1:100
    p=p*v(i);
    fprintf('%d: %13.6e\n',i,p);
    pause(0.05);
end