filename = '5_5_b_actual_current_noise.mat';
m = matfile(filename);
filedata = m.ans;


%The directly measured current noise
noise = filedata(2,:);
var_b2 = var(noise); % i grader
var_b2 = var_b2*pi/180;
