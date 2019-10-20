V=1
syms I1 I2
eqns = [ -V+2*j*I1== I2*(5+2*j); V+2*j*I2== I1*(5+3*j)]
I=vpasolve(eqns, [I1; I2], [1; 1])
Rth=V/(I(2)-I(1))
