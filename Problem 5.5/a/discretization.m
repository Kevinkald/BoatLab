%Constants
omega_0 = 0.7823; sigma = 0.0281;
T = 72.4391; K = 0.1561;
lambda = 0.0928;
K_w = 2*lambda*omega_0*sigma;
%w_v = 1; w_b = 1;

%Matrices of Model
A = [[0         1                   0       0       0       ]
    [-omega_0^2 2*lambda*omega_0    0       0       0       ]
    [0          0                   0       1       0       ]
    [0          0                   0       -1/T    -K/T    ]
    [0          0                   0       0       0       ]];

B = [0 0 0 K/T 0]';

C = [0 1 1 0 0];

E = [[0 K_w 0 0 0]
    [ 0 0   0 0 1]]';

%Q = w_v;
%R = w_b;

%Discretization
fs = 10;
Ts = 1/fs;
n = 5;
syms s
v = [s s s s s];

A_d = ilaplace(inv((diag(v)-A)), s, Ts);

%Benytter pseudoinvers
B_d = pinv(A)*(A_d-eye(5))*B;

C_d = C;

D_d = 0;

%Q_d = ;

%R_d = R/T;

[A_d2 B_d2] = c2d(A,B,Ts);
[A_d2 E_d2] = c2d(A,E,Ts);