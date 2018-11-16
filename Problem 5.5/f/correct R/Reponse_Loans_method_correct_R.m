%Loading regular method file
filename = '5_5_f_regular_method_correct_R.mat';
m = matfile(filename);
filedata = m.ans;

%Loading loans method file
filename2 = '5_5_f_loans_correct_R.mat';
m2 = matfile(filename2);
filedata2 = m2.ans;

%Regular params
time = filedata(1,:);
psi = filedata(2,:);
psi_r = filedata(3,:);
psi_est = filedata(4,:);
rudder = filedata(5,:);
rudder_bias = filedata(6,:);

%Loans method params
time_2 = filedata2(1,:);
psi_2 = filedata2(2,:);
psi_r_2 = filedata2(3,:);
psi_est_2 = filedata2(4,:);
rudder_2 = filedata2(5,:);
rudder_bias_2 = filedata2(6,:);


figure;
subplot(2,2,1);
plot(time,psi,'r');
title('Regular method: E*Q*E^T');
hold on;
plot(time,psi_r,'b');
plot(time, psi_est, 'g');
xlim([0, 100]);
ylim([-5,50]);
xlabel('time t [s]');
ylabel('Angle [deg]');
legend('$\psi$(t)','$\psi_r$(t)', '$\hat{\psi}$(t)','Interpreter','latex');

subplot(2,2,2);
plot(time,rudder,'r');
title('Regular method: E*Q*E^T');
hold on;
plot(time, rudder_bias, 'b');
xlim([0, 200]);
xlabel('time t [s]');
ylabel('Angle [deg]');
legend('\delta(t)', 'b(t)');

%plotting loans method
subplot(2,2,3);
plot(time_2,psi_2,'r');
title('Loans method');
hold on;
plot(time_2,psi_r_2,'b');
plot(time_2, psi_est_2, 'g');
xlim([0, 100]);
ylim([-5,50]);
xlabel('time t [s]');
ylabel('Angle [deg]');
legend('$\psi$(t)','$\psi_r$(t)', '$\hat{\psi}$(t)','Interpreter','latex');


subplot(2,2,4);
plot(time_2,rudder_2,'r');
title('Loans method');
hold on;
plot(time_2, rudder_bias_2, 'b');
xlim([0, 200]);
xlabel('time t [s]');
ylabel('Angle [deg]');
legend('\delta(t)', 'b(t)');