pkg load geometry
A=[5/4+j -j; -j-2 j/2]
b=[6;0]

V=inverse(A)*b

Vp=V(1) %Resultado ok
Vq=V(2) %Resultado ok

%nodo p es el de la resistencia de 1. nodo q es el del inductor

%ip1: va hasta p saliendo de la fuente de 24 = IR4
%ip2: es la que va por la resistencia de 1 a gnd
%iqp : ya te dice de donde a donde va, de q a p.
%iq1: va de q a gnd
%iq2: es saliente a la fuente de corriente, llega al nodo q.

%aca la notacion es medio engorrosa, quise optimizarla y quedo mas confuso:
%formato de tensiones: V _quees_valordeloquees_nodo/s
V_r_4_p=(24-Vp) %Ok %Resultado ok
V_r_1_p=Vp  %Ok %Resultado ok
V_c_nj_pq=Vq-Vp %nj es -j %OK ojo que el nombre es pq y no qp como indica la cuenta %Resultado ok
V_l_j2_q=Vq %OK %Resultado ok
V_r_2_q=2*2*Vp   %OK es el m�s a la derecha %Resultado ok

ip1=V_r_4_p/4 %OK IR4 %Resultado ok
ip2=V_r_1_p/1  %OK le agregu� el /1 para entenderlo mejor %Resultado ok
iqp=V_c_nj_pq/(-j)   %OK ac� esta bien el qp %Resultado ok
iq1=V_l_j2_q/(j*2) %OK %Resultado ok
iq2=2*Vp %OK

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
V_fte_cte= V_r_2_q+Vq
sf1=24*conj(ip1)
sf2=(V_r_2_q+Vq)*conj(iq2) %Ok

sr_4_p=V_r_4_p*conj(ip1) %OK
sr_1_p=V_r_1_p*conj(ip2) %OK
sr_2_q=V_r_2_q*conj(iq2) %OK
sl=V_l_j2_q*conj(iq1) %OK
sc=V_c_nj_pq*conj(iqp) %OK

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
delta= sf1+sf2-sr_1_p-sr_4_p-sr_2_q-sl-sc
cmap=hsv(2)

diagrama_fasorial_flechas([ip1 ip2 iq1 iqp iq2 ]',1,cmap(1,:))
diagrama_fasorial_flechas([V_c_nj_pq V_l_j2_q V_r_1_p V_r_2_q V_r_4_p V_fte_cte 24]',0,1,cmap(2,:))