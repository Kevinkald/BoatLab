filename = '5_3_d.mat';
m = matfile(filename);
filedata = m.ans;

time = filedata(1,:);
psi = filedata(2,:);
psi_r = filedata(3,:);
rudder = filedata(4,:);

figure;
subplot(1,2,1);
plot(time,psi,'r');
hold on;
plot(time,psi_r,'b');
xlim([0, 500]);
xlabel('time t [s]');
ylabel('Angle [deg]');
legend('y(t)','\psi_r(t)');

subplot(1,2,2);
plot(time,rudder,'r');
xlim([0, 500]);
xlabel('time t [s]');
ylabel('Angle [deg]');
legend('\delta(t)');