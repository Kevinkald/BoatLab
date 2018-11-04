%Opening the wave data from file
filename1 = '../../wave.mat';
m1 = matfile(filename1);
filedata = m1.psi_w;

%Extracting the data and converting [deg] to [rad]
psi_w = filedata(2,:).*(pi/180);

%Calculating the PSD, pxx[power/Hz] with frequencies f[Hz]
fs = 10;
[pxx, f] = pwelch(psi_w,4096,[],[],fs);

%Converting frequency f[Hz] to omega[rad/s]
omega = f.*2*pi;

%Converting PSD[power/Hz] to PSD[power s/rad]
p_xx = pxx./(2*pi);

%plotting the PSD
plot(omega,p_xx);
xlim([0 2*pi]);
xlabel('Angular frequency \omega [rad/s]');
ylabel('Power spectral density S_{\psi_\omega}(\omega) [power s/rad]');
legend('S_{\psi_\omega}(\omega)');

%Finding the modal peak frequency omega_0 and intensity sigma
[peak, idx] = max(p_xx);
omega_0 = omega(idx)
sigma = sqrt(peak)