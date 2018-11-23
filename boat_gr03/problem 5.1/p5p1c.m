%Running the simulation
sim('p5p1cx.mdl')

%Opening the data from file
filename1 = '5_1_c.mat';
m1 = matfile(filename1);
array = m1.ans;

%The oscillatory response
y_oscill = array(2,[2000:4000]);
y_max = max(y_oscill);
y_min = min(y_oscill);
y_mean = (y_max + y_min)/2;
y_amplitude = y_max-y_mean;

%Plotting the response and the mean-line
y = array(2,:);
t = array(1,:);
plot(t,y);
hold on;
line([0 6000],[y_mean y_mean],'LineStyle','--','color','red');
legend('H(j0.05)','Mean');
xlabel('time t [s]');
ylabel('H(j0.05)');

delete 5_1_c.mat;