# Arrow type
 clf;
 orig   = [cumsum(0.5*ones(3,1))-0.5 zeros(3,1)];
 tip    = orig + [0 1];
 arrows = [orig tip];

 # Different ratios
 subplot (2,1,1)
 r = [0.8 0.5 0.1];
 h = drawArrow (arrows, 1, 0.1, r);
 title ("Ratios (3rd argument)")
 text (tip(:,1)+0.1,tip(:,2)-0.5,arrayfun(@num2str, r,"unif", 0))

 # Different types
 subplot (2,1,2)
 ht = [0 0.5 1];
 h = drawArrow (arrows, 1, 0.1 , 0.1, ht);
 title ("Head types (4th argument)")
 text (tip(:,1)+0.1,tip(:,2)-0.5,arrayfun(@num2str, ht,"unif", 0))
