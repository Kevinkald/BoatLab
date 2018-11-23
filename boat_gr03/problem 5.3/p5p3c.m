% Initializing:

Kpd = 0.8427; Td = 72.4391; Tf = 8.391;

% Simulating:

sim('p5p3c_.mdl')

% Plotting:

filename = '5_3_c.mat';
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
ylim([-5,35]);
xlabel('time t [s]');
ylabel('Angle [deg]');
legend('\psi(t)','\psi_r(t)');

subplot(1,2,2);
plot(time,rudder,'r');
xlim([0, 150]);
xlabel('time t [s]');
ylabel('Angle [deg]');
legend('\delta(t)');