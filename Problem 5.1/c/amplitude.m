%Opening the data from file
filename1 = '5c_05.mat';
m1 = matfile(filename1);
array = m1.ans;

filename2 = '5c_005.mat';
m2 = matfile(filename2);
array2 = m2.ans;

%The oscillatory response
y_oscill = array(2,[2000:4000]);
y_max = max(y_oscill);
y_min = min(y_oscill);
y_mean = (y_max + y_min)/2;
y_amplitude = y_max-y_mean;

y_oscill_noise = array2(2,[2000:4000]);
y_max_noise = max(y_oscill_noise);
y_min_noise = min(y_oscill_noise);
y_mean_noise = (y_max_noise + y_min_noise)/2;
y_amplitude_noise = y_max_noise-y_mean_noise;

%Plotting the response and the mean-line
y = array(2,:);
t = array(1,:);

y_noise = array2(2,:);
t_noise = array2(1,:);

subplot(2,1,2);
plot(t,y);
hold on;
line([0 6000],[y_mean y_mean],'LineStyle','--','color','red');
legend('H(j0.05)','Mean');
xlabel('time t [s]');
ylabel('H(j0.05)');

subplot(2,1,1);
plot(t_noise,y_noise);
hold on;
line([0 6000],[y_mean_noise y_mean_noise],'LineStyle','--','color','red');
legend('H(j0.005)','Mean');
xlabel('time t [s]');
ylabel('H(j0.005)');