A=[5/4+j -j; -j-2 j/2]
b=[6;0]

V=inverse(A)*b

Vp=V(1)
Vq=V(2)

V_r_4_p=(24-Vp)
V_r_1_p=Vp
V_c_nj_pq=Vq-Vp
V_l_j2_q=Vq
V_r_2_q=2*2*Vp

ip1=V_r_4_p/4
ip2=V_r_1_p
iqp=V_c_nj_pq/(-j)
iq1=V_l_j2_q/(j*2)
iq2=2*Vp

sf1=V_r_4_p*conj(ip1)
sf2=(V_r_2_q+Vq)*conj(iq2)

sr_4_p=V_r_4_p*conj(ip1)
sr_1_p=V_r_1_p*conj(ip2)
sr_2_q=V_r_2_q*conj(iq2)
sl=V_l_j2_q*conj(iq1)
sc=V_c_nj_pq*conj(iqp)


delta= sf1+sf2-sr_1_p-sr_1_p-sr_2_q-sl-sc

%diagrama_fasorial([i1 i2 ic ip iq vc vl vr1 vr2 vr3 ]')