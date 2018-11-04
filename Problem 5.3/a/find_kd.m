%Implementation of the open loop transfer function
s = tf('s');
K = 0.1561; T = 72.4391; omega_c = 0.1; 

%PD parameters
Kd = 0.90; Td = T; Tf = 1/omega_c;

%Transfer function H_0
H_0 = (K*Kd)/(s*(1+Tf*s));

%Plotting the bode plots of H_0
%margin(H_0);