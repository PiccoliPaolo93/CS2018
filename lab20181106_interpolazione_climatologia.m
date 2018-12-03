clear; clc; %uso il clear perchè senza questo, lo strumento per la legenda fa i pasticci

L=[-55;-45;-35;-25;-15;-5;5;15;25;35;45;55;65];
Dt=[3.7;3.7;3.52;3.27;3.2;3.15;3.15;3.25;3.47;3.52;3.65;3.62;3.52];
Ls1=42; %lat Roma
Ls2=59; %lat Oslo

figure(1); clf
ph(1)=plot(L,Dt,'o');
leg{1}='Dati';
grid on
xlabel('x');
ylabel('y');
hold on

%Il warning di Matlab indica un cattivo condizionamento 
 
%Polinomio di Lagrange globale
%Lat=vander(L);
%a=Lat\Dt;
%sostituisco la risoluzione del sistema lineare con backslach, conpolyfit
%a=polyfit(L,Dt,12)
L1=linspace(L(1),L(end),200);
%Dt1=polyval(a,L1);
Dt1=barycentric(L,Dt,L1);   %non fornisce il vettore dei coefficienti
                            %restituisce i valori del polinomio interpolatore nei nodi L1 di valutazione
                            %permette di rimuovere il warning su a
ph(2)=plot(L1,Dt1);
leg{2}='Polinomio di Lagrange';
legend(ph,leg);
T_Roma_Glob=barycentric(L,Dt,Ls1);
T_Oslo_Glob=barycentric(L,Dt,Ls2);
ph(3)=plot(Ls1,T_Roma_Glob,'sr'); %Brutto! Nodi equispaziati
leg{3}='Previsione Globale Roma';
legend(ph,leg);
ph(4)=plot(Ls2,T_Oslo_Glob,'xr');
leg{4}='Previsione Globale Oslo';
legend(ph,leg);

%Interpolatore composito
Dt1c=interp1(L,Dt,L1);
ph(5)=plot(L1,Dt1c);
leg{5}='Interpolazione composita di Lagrange';
legend(ph,leg);
T_Roma_Comp=interp1(L,Dt,Ls1);
T_Oslo_Comp=interp1(L,Dt,Ls2);
ph(6)=plot(Ls1,T_Roma_Comp,'sy');
leg{6}='Previsione Composita Roma';
legend(ph,leg);
ph(7)=plot(Ls2,T_Oslo_Comp,'xy');
leg{7}='Previsione Composita Oslo';
legend(ph,leg);

%Spline
Dt1s=spline(L,Dt,L1);
ph(8)=plot(L1,Dt1s);
leg{8}='Spline';
legend(ph,leg);
T_Roma_Spline=spline(L,Dt,Ls1);
T_Oslo_Spline=spline(L,Dt,Ls2);
ph(9)=plot(Ls1,T_Roma_Spline,'sc');
leg{9}='Previsione Spline Roma';
legend(ph,leg);
ph(10)=plot(Ls2,T_Oslo_Spline,'xc');
leg{10}='Previsione Spline Oslo';
legend(ph,leg);

