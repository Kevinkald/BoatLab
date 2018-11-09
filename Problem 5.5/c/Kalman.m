%function [ P, xhat ] = Kalman( xi_meas, delta, P_, x_ , y)
function [ xhat, xi, b ] = Kalman( xi_meas, delta,  y)
%KALMAN Kalmanfilters input 
%   Det er ikke denne funksjonen som brukes.
%   Den som brukes heter "MATLAB Function", og bruker ikke
%   persistent-systemet, men forer bare tilbake de a priori verdiene. Jeg
%   vet ikke hva som er best, men "MATLAB Function funker noenlunde.

persistent  init_flag A B C E x  Q R  P

% Initialize
if isempty(init_flag) 
    init_flag = 1 ;
    
    Q = [[30    0       ]
         [0     10*10^-6]];

    P0_ =  [[1      0      0      0     0        ]
            [0      0.013  0      0     0        ]
            [0      0      pi^2   0     0        ]
            [0      0      0      1     0        ]
            [0      0      0      0     2.5*10^-3]];
        
    x0_ = [0 0 0 0 0]';
    
    A = [[0.996926739262672    0.100626789614164       0       0                    0                       ]
        [-0.061582920038110    1.011537233905485       0       0                    0                       ]
        [0                     0                       1       0.099931008253684    -1.076961159999087e-05  ]
        [0                     0                       0       0.998620482470742    -2.153426863171962e-04  ]
        [0                     0                       0       0                    1                       ]];
    
    B = [0 0 1.076961159999087*10^-5 2.153426863171962*10^-4 0]';
    
    C = [0 1 1 0 0];
    
    E = [[2.048850967535938*10^-5   4.105548994630666*10^-4     0                          0                            0                   ]
        [ 0                         0                           -3.590283471015735*10^-7   -1.076961159999087*10^-5     0.100000000000000]]';
    
    % The variance of the measurement noise divided by the samilping time T = 0.1
    R = 0.345587*10^-5/0.1; 
    
    x = x0_;
    P = P0_;
else
    %P = P_;
    %x = x_;
end

 
L = P*C.'*inv(C*P*C.' + R);

xhat =  x + L * (y - C*x);

x = xhat;

P = (eye(5)- L*C) * P *(eye(5)-L*C).' + L*R*L.';

%x_ = A* x + B* 

end

