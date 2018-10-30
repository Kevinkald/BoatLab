%Opening the data from file
filename1 = '5d_step_boat.mat';
m1 = matfile(filename1);
array = m1.ans;

%Plotting the boat response
y = array(2,:);
t = array(1,:);

%Implementing the model
T = 72.4391; K = 0.1561;
s = tf('s');
H = K/(s*(T*s+1));
stepresponse_model = step(H);

%Plotting
plot(t,y,'r');
hold on;
plot(stepresponse_model,'b');
legend('The boat response','The model response');
xlabel('time t [s]');
%ylabel('H(j0.05)');