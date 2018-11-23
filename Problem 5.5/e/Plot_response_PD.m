filename = '5_5_e.mat';
m = matfile(filename);
filedata = m.ans;

filename2 = 'wave.mat';
m2 = matfile(filename2);
filedata2 = m2.psi_w;

time = filedata(1,:);
psi = filedata(2,:);
psi_r = filedata(3,:);
psi_est = filedata(4,:);
rudder = filedata(5,:);
rudder_bias = filedata(6,:);
psi_w_est = filedata(7,:);

time2 = filedata2(1,:);
psi_w = filedata2(2,:);

figure;
subplot(1,2,1);
plot(time,psi,'r');
hold on;
plot(time,psi_r,'b');
plot(time, psi_est, 'g');
xlim([0, 500]);
xlabel('time t [s]');
ylabel('Angle [deg]');
legend('y(t)','$\psi_r$(t)', '$\hat{\psi}$(t)','Interpreter','latex');

subplot(1,2,2);
plot(time,rudder,'r');
hold on;
plot(time, rudder_bias, 'b');
xlim([0, 500]);
xlabel('time t [s]');
ylabel('Angle [deg]');
legend('$\delta$(t)', '$\hat{b}$(t)','Interpreter','Latex');

figure;
plot(time2, psi_w,'r');
hold on;
plot(time, psi_w_est, 'b');
xlabel('time t [s]');
ylabel('Angle [deg]');
legend('$\psi_{w}$(t)', '$\hat{\psi}_{w}$(t)','Interpreter','Latex');
xlim([400,500]);