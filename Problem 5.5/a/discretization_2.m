%Constants
omega_0 = 0.7823; sigma = 0.0281;
T = 72.4391; K = 0.1561;
lambda = 0.0928; K_w = 2*lambda*omega_0*sigma;

%Continous model matrices
A_c = [[0         1                   0       0       0       ]
      [-omega_0^2 2*lambda*omega_0    0       0       0       ]
      [0          0                   0       1       0       ]
      [0          0                   0       -1/T    -K/T    ]
      [0          0                   0       0       0       ]];

B_c = [0 0 0 K/T 0]';

C_c = [0 1 1 0 0];

E_c = [[0 K_w 0 0 0]
      [ 0 0   0 0 1]]';

Q_c = [[30      0      ]
      [0      10^-6   ]];
    
%Discretization
fs = 10; Ts = 1/fs;
syms s;
v = [s s s s s];

% [1] Direct method of finding discretized matrices
A_d = ilaplace(inv((diag(v)-A_c)), s, Ts);
% Benytter pseudoinvers for å invertere ikke-inverterbar A-matrise
B_d = pinv(A_c)*(A_d-eye(5))*B_c;
C_d = C_c;
R_d = 1.7326*10^-4;

% [2] Using c2d to find discretized A and E matrix
[A_d2 B_d2] = c2d(A_c,B_c,Ts);