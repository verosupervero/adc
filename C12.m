I1=0
syms I2 V2
eqns = [ 100== I1*5+j*8*I1+2*j*I2; V2== 2*I2+I1*2*j+2*j*I2]
vpasolve(eqns, [I2,V2], [1;1])
