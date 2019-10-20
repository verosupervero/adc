v1=220
v2=220*e^(j*(-120/180*pi))
v3=220*e^(j*(120/180*pi))
z1=10+j
z2=9.8+j
z3=1.2+j
r=1
r2=5
syms vn
eqns = [ v1/(z1+r)+v2/(z2+r)+v3/(z3+r)== vn*(1/(z1+r)+1/(z2+r)+1/(z3+r)+1/r2)]
Vn=double(vpasolve(eqns, [vn], [1]))
p1=conj((v1-Vn)/(z1+r))
p2=conj((v2-Vn)/(z2+r))
p3=conj((v3-Vn)/(z3+r))


