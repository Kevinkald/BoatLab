%Init PD controller
T = 72.4391; Kpd = 0.8427; 
Td = T; Tf = 8.391;

%Starting simulation
sim('p5p5dx.mdl');

%Opening the generated data file
filename = '5_5_d.mat';
m = matfile(filename);
filedata = m.ans;

%Extracting the data
time = filedata(1,:);
psi = filedata(2,:);
psi_r = filedata(3,:);
rudder = filedata(4,:);
rudder_bias = filedata(5,:);

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
hold on;
plot(time, rudder_bias, 'b');
xlim([0, 150]);
xlabel('time t [s]');
ylabel('Angle [deg]');
legend('$\delta$(t)', '$\hat{b}$(t)','Interpreter', 'latex');

%Cleaning file
delete 5_5_d.mat;