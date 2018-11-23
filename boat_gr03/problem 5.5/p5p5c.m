%Init PD controller
T = 72.4391; Kpd = 0.8427; 
Td = T; Tf = 8.391;

%Starting simulation
sim('p5p5cx.mdl');