syms ip i2
eqns = [ 1-j*3*ip-j*3*ip== ip*(3+j*4+j*5)-i2*(j*5); j*3*ip== -ip*(j*5)+i2*(j*5-j*8)]
vpasolve(eqns, [ip,i2], [1;1])
