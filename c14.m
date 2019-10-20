syms i1 i2
eqns = [ 70.7+2*j*i2== i1*(5+5*j); 2*j*i1== i2*(-j*5+j*10)]
vpasolve(eqns, [i1,i2], [1;1])
