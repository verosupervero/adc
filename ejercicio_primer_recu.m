pkg load symbolic
syms Vp Vq io Vo
Ien=1
f = [ 2*Vo/40-0.1*io==Vp*(1/10+1/20+1/40)-Vq/10,0.1*io+Ien==-Vp/10+Vq/10,Vo==Vq-Vp,Vp==20*io]
V= double(vpasolve(f, [Vp,Vq,Vo,io], [1,1,1,1]))
Ven=V(2,1)
Rth=Ven/Ien

disp ('ecuaciones para Vth')

f = [ 2*Vo/40-0.1*io==Vp*(1/10+1/20+1/40)-Vq/10,0.1*io==-Vp/10+Vq/10,Vo==Vq-Vp,Vp==20*io]
V= round(double(vpasolve(f, [Vp,Vq,Vo,io], [1,1,1,1])))
Vth=V(2,1)


disp ('ecuaciones para In')

f = [ 2*Vo/40-0.1*io==Vp*(1/10+1/20+1/40),0.1*io==-Vp/10,Vo==-Vp,Vp==20*io]
V= round(double(vpasolve(f, [Vp,Vo,io], [1,1,1])))
vp=V(1,1)
Io=V(3,1)
In=-.1*Io-vp/10