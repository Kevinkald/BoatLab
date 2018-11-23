%Init PD controller
Kpd = 0.8427; T = 72.4391;
Td = T; Tf = 8.391;

%Starting simulation
sim('p5p5ex.mdl');

%Opening the generated data file
filename = '5_5_e.mat';
m = matfile(filename);
filedata = m.ans;

%Opening the wave data
filename2 = 'wave.mat';
m2 = matfile(filename2);
filedata2 = m2.psi_w;

%Extracting the generated data
time = filedata(1,:);
psi = filedata(2,:);
psi_r = filedata(3,:);
psi_est = filedata(4,:);
rudder = filedata(5,:);
rudder_bias = filedata(6,:);
psi_w_est = filedata(7,:);

%Extracting the wave influence data
time2 = filedata2(1,:);
psi_w = filedata2(2,:);

%Plotting the measured heading versus the wave filtered heading
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

%Plotting the rudder angle versus the estimated bias
subplot(1,2,2);
plot(time,rudder,'r');
hold on;
plot(time, rudder_bias, 'b');
xlim([0, 500]);
xlabel('time t [s]');
ylabel('Angle [deg]');
legend('$\delta$(t)', '$\hat{b}$(t)','Interpreter','Latex');

%Plotting the estimated wave influence verus the actual wave influence
figure;
plot(time2, psi_w,'r');
hold on;
plot(time, psi_w_est, 'b');
xlabel('time t [s]');
ylabel('Angle [deg]');
legend('$\psi_{w}$(t)', '$\hat{\psi}_{w}$(t)','Interpreter','Latex');
xlim([400,500]);

%Cleaning file
delete 5_5_e.mat;