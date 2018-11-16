filename = '5_5_e.mat';
m = matfile(filename);
filedata = m.ans;

time = filedata(1,:);
psi = filedata(2,:);
psi_r = filedata(3,:);
psi_est = filedata(4,:);
rudder = filedata(5,:);
rudder_bias = filedata(6,:);

figure;
subplot(1,2,1);
plot(time,psi,'r');
hold on;
plot(time,psi_r,'b');
plot(time, psi_est, 'g');
xlim([0, 500]);
xlabel('time t [s]');
ylabel('Angle [deg]');
legend('$\psi$(t)','$\psi_r$(t)', '$\hat{\psi}$(t)','Interpreter','latex');

subplot(1,2,2);
plot(time,rudder,'r');
hold on;
plot(time, rudder_bias, 'b');
xlim([0, 500]);
xlabel('time t [s]');
ylabel('Angle [deg]');
legend('\delta(t)', 'b(t)');