function plotsol(x,nodes,nov,lint)
noe=length(nodes);
un=zeros(noe,1);
un(lint)=x;
figure;
trep = triangulation(nov',nodes(:,1),nodes(:,2),un);
p=trisurf(trep);
set(p,'Edgecolor','none')
shading interp
view([0,90])
colorbar
colormap(jet)

