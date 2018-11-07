%Implementation of the open loop transfer function
s = tf('s');
K = 0.1561; T = 72.4391; omega_c = 0.1; 

%PD parameters
Kpd = 0.8427; Td = T; Tf = 8.391;

%Transfer function H_0
H_0 = (K*Kpd)/(s*(1+Tf*s));

%Plotting the bode plots of H_0
margin(H_0);