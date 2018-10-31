%Opening the wave data from file
filename1 = '../../wave.mat';
m1 = matfile(filename1);
psi_w = m1.psi_w;

%Defining the tf for wave response model
s = tf('s');
lambda = 1;
omega_0 = 1;
sigma = 1;
K_w = 2*lambda*omega_0*sigma;
H = K_w*s/(s^2 + s*2*lambda*omega_0 + omega_0^2);

