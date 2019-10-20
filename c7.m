clc
clear all
close all
i1=1
i2=e^(j*pi/18)
vp=e^(j*pi/18)*(-.5j)
vq= (vp*(1-2j)-1)*(0.5j)
si1=vp*conj(i1)
si2=vq*conj(i2)
ir=vp
vl=vp-vq
il=vl/(j*.5)
sl=vl*conj(il)
vc=vq
ic=j*2*vq
vr=vp
sc=vc*conj(ic)
sr=abs(vp)^2
si1+si2-sc-sr-sl

A=[i1;i2;ic;il;ir;vr;vc;vl];
diagrama_fasorial(A)