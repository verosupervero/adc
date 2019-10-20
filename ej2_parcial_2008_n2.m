pkg load symbolic
syms vq
f = [ 1+15*e^(j*2/3*pi)/(20-20*j)==vq*(1/10+1/(20-20*j)+1/(j*10))]
vpasolve(f, vq, 1)