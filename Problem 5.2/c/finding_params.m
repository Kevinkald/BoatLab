%Opening the wave data from file
filename1 = '../../wave.mat';
m1 = matfile(filename1);
psi_w = m1.psi_w;

%Caulcating the PSD
fs = 10;
[pxx, f] = pwelch(psi_w(2,:),4096,[],[],fs);

%Conerting frequency to angular frequency
p_xx = pxx/(2*pi);
omega = f*2*pi;

%plotting the PSD
plot(omega,p_xx);
xlim([0 2*pi]);
grid on;
xlabel('frequency f [rad/s]');
ylabel('Power spectral density S_{\psi_\omega}(\omega) power s/rad');
legend('S_{\psi_\omega}(\omega)');

%Finding the dominant frequency
[val, idx] = max(p_xx);
omega(idx)

%Estimating omega_0 and sigma
omega_0 = omega(idx);
sigma = sqrt(val);
