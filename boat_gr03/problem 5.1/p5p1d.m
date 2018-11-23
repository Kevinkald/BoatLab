sim('p5p1d_.mdl')

%Opening the data from file
filename1 = '5_1_d.mat';
m1 = matfile(filename1);
array = m1.ans;

%Plotting the boat response
y = array(2,:);
t = array(1,:);
plot(t,y,'r');
hold on;

%Implementing the model
T = 72.4391; K = 0.1561;
s = tf('s');
H = K/(s*(T*s+1));
stepresponse_model = step(H)/(2*pi);

%Plotting the model response
plot(stepresponse_model,'b');
legend('The boat response','The model response');
xlabel('time t [s]');
ylabel('Heading \psi [deg]');
xlim([0 5000]);