function [mod,fase,omega]=asbode(num,den,W_axes,M_axes,F_axes,par);
% ASBODE : traccia il diagramma asintotico di Bode 
% ******************************************************************************
%                 ## SYNTAX ##
%
%  ASBODE(NUM,DEN)
%     Traccia il diagramma di Bode di una funzione di trasferimento
%
%                   NUM     b_m*s^m + b_{m-1}*s^{m-1} + ... + b_1*s + b_0
%          W(s) =  ----- = -----------------------------------------------
%                   DEN     a_n*s^n + a_{n-1}*s^{n-1} + ... + a_1*s + a_0
%
%     e scrive sullo schermo i termini che compongono la fattorizzazione di
%     Bode della W(s).
%
%     Il vettore 
%          NUM = [ b_m  b_{m-1}  ...  b_1  b_0 ]  
%     contiene i coefficienti del polinomio al numeratore mentre il vettore
%          DEN = [ a_n  a_{n-1}  ...  a_1  a_0 ]  
%     contiene i coefficienti del polinomio al denominatore della W(s).
%
%     I diagrammi asintotici dei singoli termini sono tracciati in diversi colori,
%     il diagramma asintotico complessivo e' tracciato con una linea nera spessa, 
%     il diagramma reale complessivo e' tracciato con una linea nera tratteggiata. 
%     Le scale e il vettore delle frequenze sono scelti automaticamente.
%     
%  ASBODE(NUM,DEN,[W1,W2],[M1,M2],[F1,F2])
%     Specifica le scale:
%     - le scala delle ascisse in entrambi i diagrammi e' compresa fra 10^W1 e 10^W2
%     - la scala delle ordinate nel diagramma dei moduli e' compresa fra M1 e M2
%     - la scala delle ordinate nel diagramma delle fasi e' compresa fra F1 e F2 
%
%  ASBODE(NUM,DEN,[W1,W2],[M1,M2],[F1,F2],PAR)
%     Il parametro opzionale PAR consente di specificare che non si desidera
%     tracciare i diagrammi dei singoli termini ma:
%     - PAR = 1 : si traccia solo il diagramma reale complessivo
%     - PAR = 2 : si traccia solo il diagramma asintotico complessivo
%     - PAR = 3 : si tracciano entrambi i diagrammi complessivi
%                 - la curva nera tratteggiata indica il diagramma reale
%                 - la curva blu continua indica il diagramma asintotico
%
%  [MOD,FASE,W]=ASBODE(NUM,DEN)
%  [MOD,FASE,W]=ASBODE(NUM,DEN,[W1,W2],[M1,M2],[F1,F2])
%      Non traccia il diagramma ma salva i valori di modulo, fase e frequenza
%      nelle matrici
%      - MOD:  la matrice del moduli in decibel
%              - la prima colonna contiene il diagramma reale complessivo,
%              - la seconda colonna contiene il diagramma asintotico complessivo,
%              - le altre colonne contengono i diagrammi asintotici dei singoli termini
%      - FASE: la matrice delle fasi in gradi
%              - la prima colonna contiene il diagramma reale complessivo,
%              - la seconda colonna contiene il diagramma asintotico complessivo,
%              - le altre colonne contengono i diagrammi asintotici dei singoli termini
%      - W:    il vettore delle frequenze
%
%     Si veda anche BODE.
%
% Autore: Alessandro Giua. Versione 3.1, Gennaio 2007.
%
% Modificato da Carlo Denaro - versione per GNU/OCTAVE Gennaio 2009 versione 0.0.1 beta
% Modificato da Marcello & Dario - sistemato il PAR per tipologia di grafico
ni=nargin;
no=nargout;

if(ni==2),
par=2;
end

if ((ni<2) | (ni==3) | (ni==4) | (ni>6)),
    disp('Errore: controllare il numero degli argomenti')
    return
end

if (ni==5), 
   if (size(W_axes) ~= 2),
      disp('Errore: controllare il terzo argomento [W1,W2] (scala delle frequenze)')
      return
   end
   if (size(M_axes) ~= 2),
      disp('Errore: controllare il quarto argomento [M1,M2] (scala dei moduli)')
      return
   end
   if (size(F_axes) ~= 2),
      disp('Errore: controllare il quinto argomento [F1,F2] (scala delle fasi)')
      return
   end
par=2;
end

if ((ni==6) & (par~=1) & (par~=2) & (par~=3)),
    disp('Errore: il sesto argomento puo'' assumere solo valori par = 1, par = 2 o par = 3')
    return
end

% CALCOLO ZERI E POLI E I COEFFICIENTI NON NULLI DI GRADO PIU' BASSO
z=roots(num);
p=roots(den);
a0=0;
b0=0;
for i=1:length(num),
  if num(i) ~= 0,
      b0=num(i);
  end
end
for i=1:length(den),
  if den(i) ~= 0,
      a0=den(i);
  end
end

% COSTRUISCO UN VETTORE DELLE FREQUENZE CONPOSTO DA 500 PUNTI
% SPAZIATI LOGARITMICAMENTE
if ni<4,
    [i,j,nonzero]=find([z' p']);
    if isempty(nonzero),
        low=-1;
        up=1;
    else     
    low=floor(log10(0.1*min(abs(nonzero))));
    up=ceil(log10(10*max(abs(nonzero))));
    end
else
    low=W_axes(1);
    up=W_axes(2);
    if ((low ~= round(low)) | (up ~= round(up)) | (low >= up)),
    disp('Errore: per costruire il vettore di frequenze fra 10^W1 e 10^W2')
    disp('        occorre che W1 e W2 siano interi con W1 < W2 (p.e., [-1,2]).')
    return
    end
end
omega=logspace(low,up,500);

% Costruisco una matrice A con tre colonne 
% e in cui ogni riga e' associata ad un fattore
% della forma di Bode
% [K         0      1]   --> caso 1: guadagno
% [nu        0      2]   --> caso 2: nu = eccedenza poli zeri in s=0
% [tau'      0      3]   --> caso 3: zero reale
% [omega_n'  zeta'  4]   --> caso 4: coppia zeri complessi
% [tau       0      5]   --> caso 5: polo reale
% [omega_n   zeta   6]   --> caso 6: coppia poli complessi
% NB: vi e' sempre una e una sola riga con terzo indice 1,
%     vi e' al massimo una riga con terzo indice 2,
%     vi sono zero o piu' righe con terzo indice {3,4,5,6}
m=length(z);
n=length(p);
nu=0;
A=[b0/a0 0 1];
nu_z=length(find(z==0));   % numero di zeri nell'origine 
nu_p=length(find(p==0));   % numero di poli nell'origine 
nu=nu_p-nu_z;              % eccedenza poli-zeri nell'origine
if nu ~= 0,
    A = [A; nu 0 2];
end
for i=1:m,
    if (z(i)~=0 & isreal(z(i))),
        A = [A; -1/z(i) 0 3];
    elseif imag(z(i))>0,
        A = [A; abs(z(i)) -real(z(i))/abs(z(i)) 4];
    end
end
for i=1:n,
    if (p(i)~=0 & isreal(p(i))),
        A = [A; -1/p(i) 0 5];
    elseif imag(p(i))>0,
        A = [A; abs(p(i)) -real(p(i))/abs(p(i)) 6];
    end
end

[ma,na]=size(A);
A=sortrows(A,3);
% SCRIVO SULLO SCHERMO LA FATTORIZZAZIONE DI BODE
for j=1:ma,
   switch A(j,3),
   case 1
       k=A(j,1);
       k_db=round(20*log10(k));
       fprintf('\nGuadagno di Bode:         K = %g, K_db = %5.0f',k,k_db)
   case 2
       nu=A(j,1);
       fprintf('\nNumero poli nell''origine: nu = %g',nu)
   case 3
       tau=A(j,1);
       z=-1/tau;
       fprintf('\nZero reale:               z = %5.4f      tau = %5.4f',z,tau)
   case 4
       omega_n=A(j,1);
       zeta=A(j,2);
       re=-zeta*omega_n;
       im=sqrt(omega_n^2-re^2);
       DeltaM = 20*log10(2*zeta);
       omega_s=omega_n/10^(abs(zeta));
       omega_d=omega_n*10^(abs(zeta));
       fprintf('\nCoppia di zeri complessi: z = %5.4f + j%5.4f, z'' = %5.4f - j%5.4f',re,im,re,im)
       fprintf('\n                          omega_n = %5.4f, zeta = %1.2f',omega_n,zeta)
       fprintf('\n                          omega_s = %5.4f, omega_d = %5.4f',omega_s,omega_d)
       fprintf('\n                          Delta M_db = %2.0f',DeltaM)
   case 5
       tau=A(j,1);
       z=-1/tau;
       fprintf('\nPolo reale:               p = %5.4f      tau = %5.4f',z,tau)
   case 6
       omega_n=A(j,1);
       zeta=A(j,2);
       re=-zeta*omega_n;
       im=sqrt(omega_n^2-re^2);
       DeltaM = -20*log10(2*zeta);
       omega_s=omega_n/10^(abs(zeta));
       omega_d=omega_n*10^(abs(zeta));
       fprintf('\nCoppia di poli complessi: p = %5.4f + j%5.4f, p'' = %5.4f - j%5.4f',re,im,re,im)
       fprintf('\n                          omega_n = %5.4f, zeta = %1.2f',omega_n,zeta)
       fprintf('\n                          omega_s = %5.4f, omega_d = %5.4f',omega_s,omega_d)
       fprintf('\n                          Delta M_db = %2.0f',DeltaM)
   end
end
fprintf('\n\n')

% CALCOLO I DIAGRAMMI ASINTOTICI DEI SINGOLI TERMINI
for i=1:length(omega),
   w=omega(i);
   for j=1:ma,
       switch A(j,3),
       case 1
           k=A(j,1);
           gain(i,j)=20*log10(abs(k));
           phase(i,j)=180*angle(k)/pi;
       case 2
           nu=A(j,1);
           gain(i,j)=-nu*20*log10(w);
           phase(i,j)=-nu*90;
       case 3
           tau=A(j,1);
           if w < 1/abs(10*tau),
               gain(i,j)=0;
               phase(i,j)=0;
           end
           if ((w >= 1/abs(10*tau)) & (w < 1/abs(tau))),
               gain(i,j)=0;
               phase(i,j)=sign(tau)*45*(log10(w)-log10(1/abs(10*tau)));
           end
           if ((w >= 1/abs(tau)) & (w < 10/abs(tau))),
               gain(i,j)=20*log10(w*abs(tau));
               phase(i,j)=sign(tau)*45*(log10(w)-log10(1/abs(10*tau)));
           end
           if w >= 10/abs(tau),
               gain(i,j)=20*log10(w*abs(tau));
               phase(i,j)=sign(tau)*90;
           end
       case 4
           omega_n=A(j,1);
           zeta=A(j,2);
           if w < omega_n*10^(-abs(zeta)),
               gain(i,j)=0;
               phase(i,j)=0;
           end
           if ((w > omega_n*10^(-abs(zeta))) & (w < omega_n)),
               gain(i,j)=0;
               phase(i,j)=(90/zeta)*(log10(w/omega_n)+abs(zeta));
           end
           if  w == omega_n,
               gain(i,j)=0;
               phase(i,j)=90*sign(zeta);
           end
           if ((w > omega_n) & (w <= omega_n*10^(abs(zeta)))),
               gain(i,j)=40*log10(w/omega_n);
               phase(i,j)=(90/zeta)*(log10(w/omega_n)+abs(zeta));
           end
           if w > omega_n*10^(abs(zeta)),
               gain(i,j)=40*log10(w/omega_n);
               if zeta ~= 0,
                   phase(i,j)=sign(zeta)*180;
               else
                   phase(i,j)=180;
               end
           end
       case 5
           tau=A(j,1);
           if w < 1/abs(10*tau),
               gain(i,j)=0;
               phase(i,j)=0;
           end
           if ((w >= 1/abs(10*tau)) & (w < 1/abs(tau))),
               gain(i,j)=0;
               phase(i,j)=-sign(tau)*45*(log10(w)-log10(1/abs(10*tau)));
           end
           if ((w >= 1/abs(tau)) & (w < 10/abs(tau))),
               gain(i,j)=-20*log10(w*abs(tau));
               phase(i,j)=-sign(tau)*45*(log10(w)-log10(1/abs(10*tau)));
           end
           if w >= 10/abs(tau),
               gain(i,j)=-20*log10(w*abs(tau));
               phase(i,j)=-sign(tau)*90;
           end
       case 6
           omega_n=A(j,1);
           zeta=A(j,2);
           if w < omega_n*10^(-abs(zeta)),
               gain(i,j)=0;
               phase(i,j)=0;
           end
           if ((w > omega_n*10^(-abs(zeta))) & (w < omega_n)),
               gain(i,j)=0;
               phase(i,j)=-(90/zeta)*(log10(w/omega_n)+abs(zeta));
           end
           if  w == omega_n,
               gain(i,j)=0;
               phase(i,j)=-90*sign(zeta);
           end
           if ((w > omega_n) & (w <= omega_n*10^(abs(zeta)))),
               gain(i,j)=-40*log10(w/omega_n);
               phase(i,j)=-(90/zeta)*(log10(w/omega_n)+abs(zeta));
           end
           if w > omega_n*10^(abs(zeta)),
               gain(i,j)=-40*log10(w/omega_n);
               if zeta ~= 0,
                   phase(i,j)=-sign(zeta)*180;
               else
                   phase(i,j)=180;
               end
           end
       end
   end
end
% AGGIUNGO ALLE MATRICI GAIN E PHASE:
% - UNA PRIMA COLONNA CHE CONTIENE IL DIAGRAMMA REALE COMPLESSIVO 
% - UNA SECONDA COLONNA CHE CONTIENE IL DIAGRAMMA ASINTOTICO COMPLESSIVO
%
[G,P]=bode( tf(num,den) ,omega);
% trasposta la prima colonna (dava una riga)
%
gain =[(20*log10(G))' gain*ones(ma,1) gain];
% trasposta la prima colonna (dava una riga)
%
phase=[(P)' phase*ones(ma,1) phase];

% VALUTO SE OCCORRE SPOSTARE DI +/-360 IL DIAGRAMMA DELLE FASI REALE
% CALCOLATO DA BODE PERCHE' COINCIDA CON QUELLO ASINTOTICO
if phase(1,1) < phase(1,2)-180,
 phase(:,1) = P+360;
end
if phase(1,1) > phase(1,2)+180,
 phase(:,1) = P-360;
end
% TRACCIO I DIAGRAMMI 
if ((no==0) & (ni<6))
    %
    % TRACCIO I DIAGRAMMI ASINTOTICI DEI MODULI PER I SINGOLI TERMINI
    subplot(2,1,1)
    % SE K=1 E VI SONO ALTRI FATTORI IL DIAGRAMMA DEI MODULI DEL GUADAGNO 
    % NON VIENE TRACCIATO PERCHE' VALE SEMPRE ZERO E NON CONTRIBUISCE AL 
    % DIAGRAMMA RISULTANTE DEI MODULI
    if ((k==1) & (ma>1)),
      semilogx(omega,gain(:,4:ma+2),'LineWidth',1.4);
    else
      semilogx(omega,gain(:,3:ma+2),'LineWidth',1.4);
    end 
    hold on;
    %
    % TRACCIO IL DIAGRAMMA COMPLESSIVO DEI MODULI REALE E ASINTOTICO
    semilogx(omega,gain(:,1),'k--',omega,gain(:,2),'k','LineWidth',2);
    %
    hold off;
    %%title('Diagramma di Bode','FontSize',12,'FontName','Times New Roman')
    title('Diagramma di Bode')
    %%ylabel('Modulo M [db]','FontSize',12,'FontName','Times New Roman')
    ylabel('Modulo M [db]' )
    if (ni>3)
        m_min=M_axes(1);
        m_max=M_axes(2);
        if m_min >= m_max,
            disp('Errore: per la scala dei moduli [M1,M2] deve valere M1 < M2.')
            return
        end
    else 
        m_max=max(max(gain))+10;
        m_min=min(min(gain))-10;
    end
    axis([min(omega) max(omega) m_min m_max]);
    set(gca,'FontSize',12,'FontName','Times New Roman')
    grid
    %
    % TRACCIO I DIAGRAMMI ASINTOTICI DELLE FASI PER I SINGOLI TERMINI
    subplot(2,1,2)
    % SE K=1 E VI SONO ALTRI FATTORI IL DIAGRAMMA DELLE FASI DEL GUADAGNO 
    % NON VIENE TRACCIATO PERCHE' VALE SEMPRE ZERO E NON CONTRIBUISCE AL 
    % DIAGRAMMA RISULTANTE DELLE FASI
    if ((k==1) & (ma>1)),   
      semilogx(omega,phase(:,4:ma+2),'LineWidth',1.4);
    else
      semilogx(omega,phase(:,3:ma+2),'LineWidth',1.4);
    end
    hold on;
    %
    % TRACCIO IL DIAGRAMMA DELLE FASI REALE E ASINTOTICO
    semilogx(omega,phase(:,1),'k--',omega,phase(:,2),'k','LineWidth',2);
    %
    hold off;
    set(gca,'YTick',-720:45:720,'FontSize',12,'FontName','Times New Roman')
    grid
    xlabel('Pulsazione \omega [rad/s]','FontSize',12,'FontName','Times New Roman')
    ylabel('Fase \phi [gradi]','FontSize',12,'FontName','Times New Roman')
    if (ni==5)
        f_min=F_axes(1);
        f_max=F_axes(2);
        if f_min >= f_max,
            disp('Errore: per la scala delle fasi [F1,F2] deve valere F1 < F2.')
            return
        end
    else
        f_max=max(max(phase))+20;
        f_min=min(min(phase))-20;
    end
    axis([min(omega) max(omega) f_min f_max]);
end 
if (ni ==6), % TRACCIO SOLO I GRAFICI SPECIFICATI DAL PARAMETRO par
    subplot(2,1,1)
    switch par
          case {1}
            semilogx(omega,gain(:,1),'k','LineWidth',2);
            title('Diagramma di Bode','FontSize',12,'FontName','Times New Roman')
          case {2}
            semilogx(omega,gain(:,2),'b','LineWidth',2);
            title('Diagramma di Bode asintotico','FontSize',12,'FontName','Times New Roman')
          case {3}
            semilogx(omega,gain(:,1),'k--',omega,gain(:,2),'b','LineWidth',2);
            title('Diagramma di Bode: reale (curva nera a tratti) e asintotico (curva blu continua)','FontSize',12,'FontName','Times New Roman')
    end
    ylabel('Modulo M [db]','FontSize',12,'FontName','Times New Roman')
    if (ni>3)
        m_min=M_axes(1);
        m_max=M_axes(2);
        if m_min >= m_max,
            disp('Errore: per la scala dei moduli [M1,M2] deve valere M1 < M2.')
            return
        end
    else
        m_max=max(max(gain))+10;
        m_min=min(min(gain))-10;
    end
    axis([min(omega) max(omega) m_min m_max]);
    set(gca,'FontSize',12,'FontName','Times New Roman')
    grid
    subplot(2,1,2)
    switch par
          case {1}
            semilogx(omega,phase(:,1),'k','LineWidth',2);
          case {2}
            semilogx(omega,phase(:,2),'b','LineWidth',2);
          case {3}
            semilogx(omega,phase(:,1),'k--',omega,phase(:,2),'b','LineWidth',2);
    end   
    set(gca,'YTick',-720:45:720,'FontSize',12,'FontName','Times New Roman')
    grid
    xlabel('Pulsazione \omega [rad/s]','FontSize',12,'FontName','Times New Roman')
    ylabel('Fase \phi [gradi]','FontSize',12,'FontName','Times New Roman')
    if (ni>3)
        f_min=F_axes(1);
        f_max=F_axes(2);
        if f_min >= f_max,
            disp('Errore: per la scala delle fasi [F1,F2] deve valere F1 < F2.')
            return
        end
    else
        f_max=max(max(phase))+20;
        f_min=min(min(phase))-20;
    end
    axis([min(omega) max(omega) f_min f_max]);
end 
if (no>0),
    mod=gain;
    fase=phase;      
end
return
