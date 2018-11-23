%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Opening the wave data from file
filename1 = '../Common Files/wave.mat';
m1 = matfile(filename1);
filedata = m1.psi_w;

%Extracting the data and converting [deg] to [rad]
psi_w = filedata(2,:).*(pi/180);

%Calculating the PSD, pxx[power/Hz] with frequencies f[Hz]
%using a window of size 4096 and sample frequency fs
fs = 10;
[pxx, f] = pwelch(psi_w,4096,[],[],fs);

%Converting frequency f[Hz] to omega[rad/s]
omega = f.*2*pi;

%Converting PSD[power/Hz] to PSD[power s/rad]
p_xx = pxx./(2*pi);

%plotting the PSD
figure;
plot(omega,p_xx);
xlim([0 2*pi]);
xlabel('Angular frequency \omega [rad/s]');
ylabel('Power spectral density S_{\psi_\omega}(\omega) [power s/rad]');
legend('S_{\psi_\omega}(\omega)');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% b
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Defining the tf for wave response model
s = tf('s');
lambda = 1;
omega_0 = 1;
sigma = 1;
K_w = 2*lambda*omega_0*sigma;
H = K_w*s/(s^2 + s*2*lambda*omega_0 + omega_0^2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% c
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Opening the wave data from file
filename1 = '../../wave.mat';
m1 = matfile(filename1);
filedata = m1.psi_w;

%Extracting the data and converting [deg] to [rad]
psi_w = filedata(2,:).*(pi/180);

%Calculating the PSD, pxx[power/Hz] with frequencies f[Hz]
%using a window of size 4096 and sample frequency fs
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
disp("The modal peak frequency:")
omega_0 = omega(idx)
disp("The intensity sigma:")
sigma = sqrt(peak)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% d 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Opening the wave data from file
filename1 = '../../wave.mat';
m1 = matfile(filename1);
filedata = m1.psi_w;

%Extracting the data and converting [deg] to [rad]
psi_w = filedata(2,:).*(pi/180);

%Calculating the PSD, pxx[power/Hz] with frequencies f[Hz]
%using a window of size 4096 and sample frequency fs
fs = 10;
[pxx, f] = pwelch(psi_w,4096,[],[],fs);

%Converting frequency f[Hz] to omega[rad/s]
omega = f.*2*pi;

%Converting PSD[power/Hz] to PSD[power s/rad]
p_xx = pxx./(2*pi);

%Finding the modal peak frequency omega_0 and intensity sigma
[peak, idx] = max(p_xx);
omega_0 = omega(idx);
sigma = sqrt(peak);

%Least squares method to estimate lambda
fun = @(lambda,omega)(omega.^2 * (2*lambda*omega_0*sigma).^2)./((omega_0.^2-omega.^2).^2+4*omega*lambda.^2*omega_0.^2);
lambda = lsqcurvefit(fun, 0.1, omega, p_xx);

%plotting the estimated PSD
figure;
plot(omega,p_xx);
hold on;

%plotting the PSD using LSQ method
K_w = 2*lambda*omega_0*sigma;
P_ww = (omega.^2 * (2*lambda*omega_0*sigma).^2)./((omega_0.^2-omega.^2).^2+4*omega*lambda.^2*omega_0.^2);
plot(omega, P_ww);
xlim([0 2*pi]);
grid on;
xlabel('frequency \omega [rad/s]');
ylabel('Power spectral density [power s/rad]');
legend('S_{\psi_w}(\omega)','P_{\psi_w}(\omega)');
hold on;