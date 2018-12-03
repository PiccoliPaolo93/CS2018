clear;
A=imread('trecolori','png');
figure(1); clf
image(A)
whos

[n,m,dim]=size(A);
R=double(A(:,:,1));
G=double(A(:,:,2));
B=double(A(:,:,3));

subplot(2,2,1); image(A)
subplot(2,2,2); mesh(R); title('R'); xlabel('colonna'); ylabel('riga');
subplot(2,2,3); mesh(G); title('G'); xlabel('colonna'); ylabel('riga');
subplot(2,2,4); mesh(B); title('B'); xlabel('colonna'); ylabel('riga');


