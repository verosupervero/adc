syms I i2
eqns = [ imag(I)== 0; I+i2== -j+1]
vpasolve(eqns, [I,i2], [1;1])