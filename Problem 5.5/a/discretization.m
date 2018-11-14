%Constants
omega_0 = 0.7823; sigma = 0.0281;
T = 72.4391; K = 0.1561;
lambda = 0.0928; K_w = 2*lambda*omega_0*sigma;
R = 0.002033;

%Model matrices
A = [[0         1                   0       0       0       ]
    [-omega_0^2 2*lambda*omega_0    0       0       0       ]
    [0          0                   0       1       0       ]
    [0          0                   0       -1/T    -K/T    ]
    [0          0                   0       0       0       ]];

B = [0 0 0 K/T 0]';

C = [0 1 1 0 0];

E = [[0 K_w 0 0 0]
    [ 0 0   0 0 1]]';

%Discretization
fs = 10; Ts = 1/fs;
syms s
v = [s s s s s];

% [1] Direct method of finding discretized matrices
A_d = ilaplace(inv((diag(v)-A)), s, Ts);
% Benytter pseudoinvers for å invertere ikke-inverterbar A-matrise
B_d = pinv(A)*(A_d-eye(5))*B;
C_d = C;
R_d = R/Ts;

% [2] Using c2d to find discretized A, B and E matrices
[A_d2 B_d2] = c2d(A,B,Ts);
[A_d2 E_d2] = c2d(A,E,Ts);