%Init PD controller
Kpd = 0.8427; T = 72.4391;
Td = T; Tf = 8.391;

%Starting simulation
sim('p5p5cx.mdl');