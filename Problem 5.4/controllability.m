%Constants
omega_0 = 0.7823;
T = 72.4391;
K = 0.1561;
lambda = 0.0928;

%No disturbances
A = [[0     1   ]
     [0     -1/T]];
C = [1 0];

O_1 = obsv(A,C);
rank_O_1 = rank(O_1);

%With current disturbance
A = [[0     1       0]
    [ 0   -1/T   -K/T]
    [ 0     0      0]];

C = [1 0 0];

O_2 = obsv(A,C);
rank_O_2 = rank(O_2);

%With wave disturbance
A = [[0         1                   0       0       ]
    [-omega_0^2 2*lambda*omega_0    0       0       ]
    [0          0                   0       1       ]
    [0          0                   0       -1/T    ]];

C = [0 1 1 0];

rank(obsv(A,C))

%With wave disturbance and current
%With wave disturbance
A = [[0         1                   0       0       0       ]
    [-omega_0^2 2*lambda*omega_0    0       0       0       ]
    [0          0                   0       1       0       ]
    [0          0                   0       -1/T    -K/T    ]
    [0          0                   0       0       0       ]];

C = [0 1 1 0 0];

O_4 = obsv(A,C);
rank_O_4 = rank(O_4);