clear; close all;
A=imread('scia','png');
figure(1); clf
h1=image(A);

[n,m,dim]=size(A);
R=double(A(:,:,1));
G=double(A(:,:,2));
B=double(A(:,:,3));

figure(2); clf
subplot(2,2,1); image(A)
subplot(2,2,2); mesh(R); title('R'); xlabel('colonna'); ylabel('riga'); view([0 -90]);
subplot(2,2,3); mesh(G); title('G'); xlabel('colonna'); ylabel('riga'); view([0 -90]);
subplot(2,2,4); mesh(B); title('B'); xlabel('colonna'); ylabel('riga'); view([0 -90]);

% M=ones(2,2);
% R1=kron(R,M);
% G1=kron(G,M);
% B1=kron(B,M);
% [n1,m1]=size(R1);

%% interpolazione bilineare
multi=4; % fattore d'ingrandimento
[x,y]=meshgrid(1:m,1:n);
[x1,y1]=meshgrid(1:1/multi:m,1:1/multi:n);
R1=interp2(x,y,R,x1,y1);
G1=interp2(x,y,G,x1,y1);
B1=interp2(x,y,B,x1,y1);

%A1=zeros(n1,m1,3);
A1(:,:,1)=uint8(R1);
A1(:,:,2)=uint8(G1);
A1(:,:,3)=uint8(B1);

figure(3); clf
h2=image(A1);

figure(4); clf
subplot(2,2,1); image(A1)
subplot(2,2,2); mesh(R1); title('R'); xlabel('colonna'); ylabel('riga'); view([0 -90]);
subplot(2,2,3); mesh(G1); title('G'); xlabel('colonna'); ylabel('riga'); view([0 -90]);
subplot(2,2,4); mesh(B1); title('B'); xlabel('colonna'); ylabel('riga'); view([0 -90]);

whos

imwrite(A1,'scia_interp.png','png');

%% interpolazione spline
multi=8; % fattore d'ingrandimento
[x,y]=meshgrid(1:m,1:n);
[x1,y1]=meshgrid(1:1/multi:m,1:1/multi:n);
R1=interp2(x,y,R,x1,y1,'spline');
G1=interp2(x,y,G,x1,y1,'spline');
B1=interp2(x,y,B,x1,y1,'spline');

%A1=zeros(n1,m1,3);
A1(:,:,1)=uint8(R1);
A1(:,:,2)=uint8(G1);
A1(:,:,3)=uint8(B1);

figure(5); clf
h2=image(A1);

figure(6); clf
subplot(2,2,1); image(A1)
subplot(2,2,2); mesh(R1); title('R'); xlabel('colonna'); ylabel('riga'); view([0 -90]);
subplot(2,2,3); mesh(G1); title('G'); xlabel('colonna'); ylabel('riga'); view([0 -90]);
subplot(2,2,4); mesh(B1); title('B'); xlabel('colonna'); ylabel('riga'); view([0 -90]);

whos

imwrite(A1,'scia_spline.png','png');