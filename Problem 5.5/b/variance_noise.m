filename = '5_3_d.mat';
m = matfile(filename);
filedata = m.ans;

%Extracting data and calculating the variance
%of the measurement noise
noise = filedata(2,:);
var_b = var(noise);
%Converting [deg] to [rad]
var_b = var_b*pi/180;