%Constants
omega_0 = 0.7823;
T = 72.4391;
K = 0.1561;
lambda = 0.0928;

%No disturbances
A = [[0         0       0       0       0]
    [-omega_0^2 0       0       0       0]
    [0          0       0       1       0]
    [0          0       0       -1/T    0]
    [0          0       0       0       0]];

C = [0 0 1 0 0];

rank(obsv(A,C))

%With current disturbance
A = [[0         0       0       0       0   ]
    [-omega_0^2 0       0       0       0   ]
    [0          0       0       1       0   ]
    [0          0       0       -1/T    -K/T]
    [0          0       0       0       0   ]];

C = [0 0 1 0 0];

rank(obsv(A,C))

%With wave disturbance
A = [[0         1                   0       0       0       ]
    [-omega_0^2 2*lambda*omega_0    0       0       0       ]
    [0          0                   0       1       0       ]
    [0          0                   0       -1/T    -K/T    ]
    [0          0                   0       0       0       ]];

C = [0 1 1 0 0];

rank(obsv(A,C))
