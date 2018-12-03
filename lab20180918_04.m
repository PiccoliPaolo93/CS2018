close all
[x,y]=meshgrid(-2*pi:.1:2*pi);
f=@(x,y,t)[sin(x).*y/5*cos(t)];
nframes=50;
tt=linspace(0,2*pi,nframes);
figure(1);
clf;
Mv=moviein(nframes);

for n=1:nframes
    t=tt(n);
    z=f(x,y,t);
    mesh(x,y,z);
    axis([-2*pi 2*pi -2*pi 2*pi -1.4 1.4]);
    Mv(n)=getframe;
    %pause(0.01);
end
movie(Mv,4);