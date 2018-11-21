filename = '5_3_d.mat';
m = matfile(filename);
filedata = m.ans;

%The directly measured current noise
noise = filedata(2,:);
var_b = var(noise); % i grader
var_b = var_b*pi/180;