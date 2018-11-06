%Constants
omega_0 = 0.7823;
T = 72.4391;
K = 0.1561;
lambda = 0.0928;

%With wave disturbance
A = [[0         1                   0       0       0       ]
    [-omega_0^2 2*lambda*omega_0    0       0       0       ]
    [0          0                   0       1       0       ]
    [0          0                   0       -1/T    -K/T    ]
    [0          0                   0       0       0       ]];

C = [0 1 1 0 0];
