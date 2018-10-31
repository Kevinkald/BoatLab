%Opening the wave data from file
filename1 = '../../wave.mat';
m1 = matfile(filename1);
psi_w = m1.psi_w;

%Caulcating the PSD
fs = 10;

[pxx, f] = pwelch(psi_w(2,:),4096,[],[],fs);

%Converting deg to rad
p_xx = pxx/(2*pi);
omega = f*2*pi;

%Finding the dominant frequency
[val, idx] = max(p_xx);
omega(idx);

%Estimating omega_0 and sigma
omega_0 = omega(idx);
sigma = sqrt(val);

%Least square method to estimate lambda
fun = @(lambda,omega)(omega.^2 * (2*lambda*omega_0*sigma).^2)./((omega_0.^2-omega.^2).^2+4*omega*lambda.^2*omega_0.^2);
lambda = lsqcurvefit(fun, 0.1, omega, p_xx);

%plotting the estimated PSD
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
legend('S_{\psi_\omega}(\omega)','P_{\psi_\omega}(\omega)');
hold on;