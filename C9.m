w=0:0.01:100;
t=pi/2;
In = @(w) (w.^2-w)./(w.^2-j*w-1);
plot(abs(In(w)));
