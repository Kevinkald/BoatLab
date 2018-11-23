%Init PD controller
Kpd = 0.8427; T = 72.4391;
Td = T; Tf = 8.391;

%Starting simulation
sim('p5p3dx.mdl')

%Opening the generated data file
filename = '5_3_d.mat';
m = matfile(filename);
filedata = m.ans;

%Extracting the data
time = filedata(1,:);
psi = filedata(2,:);
psi_r = filedata(3,:);
rudder = filedata(4,:);

%Plotting
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

%Cleaning file
delete 5_3_d.mat;