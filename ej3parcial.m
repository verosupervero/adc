syms vp vq
eqns = [ 24/4== vp*(1/4+1+1/(-j))-vq*(1/(-j)); 2*vp==-vp*(1/(-j))+vq*(1/(-j)+1/(j*2)) ]
V=vpasolve(eqns, [vp,vq], [1;1])
Vp=double(V(1))
Vq=double(V(2))

i1=(24-Vp)/4
ip=Vp
ic=(Vp-Vq)/(-j)
iq=Vq/(j*2)
i2=iq-ic

vf1=24
vf2=Vq

vr1=(24-Vp)
vr2=Vp

vc=Vp-Vq
vl=Vq
vr3=2*i2

sf1=vf1*conj(i1)
sf2=vf2*conj(i2)

sr1=vr1*conj(i1)
sr2=vr2*conj(ip)
sr3=vr3*conj(i2)
sl=vl*conj(iq)
sc=vc*conj(ic)


sf1+sf2-sr1-sr2-sr3-sl-sc

diagrama_fasorial([i1 i2 ic ip iq vc vl vr1 vr2 vr3 ]')


