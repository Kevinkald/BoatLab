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

%Discretization
fs = 10;
Ts = 1/fs;
syms s
v = [s s s s s];

% [1] The direct matrix computation
A_d = ilaplace(inv((diag(v)-A_c)), s, Ts);
B_d = pinv(A_c)*(A_d-eye(5))*B_c;
C_d = C_c;
% [2] Raskere løsning med innebygd funksjon
[A_d2 B_d2] = c2d(A_c,B_c,Ts);
[A_d2 E_d2] = c2d(A_c,E_c,Ts);

%Finding the discretized PSDs Q and R
Q_c =  [[29            0       ]
        [0           10*10^-6  ]];

R_c = 0.345587*10^-5;
R_d = R_c/Ts;

%Loans method page 126
% x_dot = F*x + G*u same as x_dot = A_c*x + B_c*u
%     z = H*x + v   same as y = C_c*x + v

% [1] Forming A
G = E_c; W = Q_c;
F = A_c;
A = [-F G*W*G'; zeros(5) F'];
% [2] Forming B
B = expm(A*Ts);
% [3] Transpose of lower-right of B to give Phi
Phi = B(6:10,6:10)';
% [4] Q_d is now found as
Q_d = Phi * B(1:5,6:10);