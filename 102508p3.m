syms vp vth vq
vx=vp-vth
eqns = [ 30*j/(j*20)-3*vx== vp*(1/(j*20)+1/(-j*5)+1)-vth; 0==-vp+vth*(1+1/5)]
vpasolve(eqns, [vp,vth], [1;1])

%%ecuaciones de zth
vn=vp-vq
eqns = [ -3*vn== vp*(1/(j*20)+1/(-j*5)+1)-vq; 1==-vp+vq*(1+1/5)]
vpasolve(eqns, [vp,vq], [1;1])