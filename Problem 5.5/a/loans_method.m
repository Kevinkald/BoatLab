%       Loans method to aquire Q_k, chen p.126
%------------------------------------------------------------
%       x_dot = F*x + G*u   same as     x_dot = A_c*x + E_c*w
%       z = H*x + v         same as     y = C_c*x + v

% [1] Forming A
G = E_c; W = Q_c; F = A_c;
A = [-F G*W*G'; zeros(5) F'];
% [2] Forming B
B = expm(A*Ts);
% [3] Transpose of lower-right of B to give Phi
Phi = B(6:10,6:10)';
% [4] Q_k is now found as
Q_k = Phi * B(1:5,6:10);