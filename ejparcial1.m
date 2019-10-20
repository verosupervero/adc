pkg load symbolic

w=50
c2=120e-6
l1=10
l2=3
r=50
v1=100

zl1=j*w*l1
zc2=-j/(w*c2)
zr=r
zl2=j*w*l2


V=[100 0]'
A=[zl1+zc2 -zc2; -zc2 zl2+zr+zc2]

I=A\V;
i2=I(1)
i3=I(2)

syms c1 i1

zc=1/(j*w*c1)
ic=-j*imag(i2)

eqns = [ic== v1*zc^(-1)]
C1=double(vpasolve(eqns, [c1], [1]))
scnot(C1)



