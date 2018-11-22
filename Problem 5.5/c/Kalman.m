% Input: mÃ¥ling y, pÃ¥drag u
% Output: kalman filter: Estimert psi uten stÃ¸y og rudder bias b
function [psi, b] = Kalman(y, u)

persistent  init_flag A B C E X_ R Q_k P_

% Initialize
if isempty(init_flag)
    
    init_flag = 1;
     
    Q_k = [1.68080996498622e-07,2.52832988209693e-06,0,0,0;
        2.52832988209693e-06,5.05671543189852e-05,0,0,0;
        0,0,2.32004646392527e-22,5.79922670073290e-21,-3.59028347101574e-17;
        0,0,5.79922670073289e-21,1.54628259912526e-19,-1.07696115999909e-15;
        0,0,-3.59028347101574e-17,-1.07696115999909e-15,1.00000000000000e-11];
    
    R = 0.00017326;

    P_0 =  [[1      0      0      0     0        ]
            [0      0.013  0      0     0        ]
            [0      0      pi^2   0     0        ]
            [0      0      0      1     0        ]
            [0      0      0      0     2.5*10^-3]];
        
    X_0 = [0 0 0 0 0]';
    
    A = [[0.996926739262672    0.100626789614164       0       0                    0                         ]
        [-0.061582920038110    1.011537233905485       0       0                    0                         ]
        [0                     0                       1       0.099931008253684    -1.076961159999087*10^-5  ]
        [0                     0                       0       0.998620482470742    -2.153426863171962*10^-4  ]
        [0                     0                       0       0                    1                         ]];
    
    B = [0 0 1.076961159999087*10^-5 2.153426863171962*10^-4 0]';
    
    C = [0 1 1 0 0];
    
    E = [[2.048850967535938*10^-5   4.105548994630666*10^-4     0                          0                            0                   ]
        [ 0                         0                           -3.590283471015735*10^-7   -1.076961159999087*10^-5     0.100000000000000   ]]';
    
    X_ = X_0;
    P_ = P_0;
end
%Kode som kjøres etter init av KF
    
%Omgjøring av input [deg] til [rad]
y = y.*(pi/180);
u = u.*(pi/180);

% [1] Computing the kalman gain L
L = P_*C.'*inv(C*P_*C.' + R);
    
% [2] Updating the estimate with the measurement y
X_hat = X_ + L * (y - C*X_);
    
% [3] Updating the error covariance matrix P
% This formula holds for both optimal and suboptimal gain L
P = (eye(5)- L*C) * P_ *(eye(5)-L*C).' + L*R*L.';
    
% [4] Projecting ahead
X_ = A*X_hat + B*u;
P_ = A*P*A.' + Q_k;

% Oppdaterer output heading psi og rudder bias b
% Konverterer også fra [rad] til [deg]
psi = X_hat(3).*(180/pi);
b = X_hat(5).*(180/pi);
end