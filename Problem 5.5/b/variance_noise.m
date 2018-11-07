filename = '5_5_b_actual_measurement_noise.mat';
m = matfile(filename);
filedata = m.ans;

filename2 = '5_3_d.mat';
m2 = matfile(filename2);
filedata2 = m2.ans;

%The directly measured current noise
noise = filedata(2,:);
var_b = var(noise); % i grader
var_b = var_b*pi/180;

%The estimated current noise
var_w = 1;    
var_w = var_w*180/pi;

y = filedata2(2,:);
var_y = var(y);
var_y = var_y*pi/180;

var_b_est = var_y - var_w;