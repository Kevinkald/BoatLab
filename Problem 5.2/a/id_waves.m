%Opening the wave data from file
filename1 = '../../wave.mat';
m1 = matfile(filename1);
psi_w = m1.psi_w;

%Caulcating the PSD
fs = 10;

[pxx, f] = pwelch(psi_w(2,:),4096,[],[],fs);

%Conerting deg to rad
p_xx = pxx/(2*pi);
f_rad = f*2*pi;

%plotting the PSD
plot(f_rad,p_xx);
xlim([0 2*pi]);
xlabel('frequency f [rad/s]');
ylabel('Power spectral density S_{\psi_\omega}(\omega) power s/rad');
legend('S_{\psi_\omega}(\omega)');