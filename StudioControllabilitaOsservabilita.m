% Pulizia ambiente
clear
clc

% Sistema
A = [ rand 0; 0 rand ];
B = [ 1; 1 ];
C = [ 1 1 ];

% Matrice controllabilitá
P = ctrb(A, B);
% Matrice osservabilitá
Q = obsv(A, C);

% Controllo del rango
rank(P)
rank(Q)

% Decomposizioni di Kalman
ctrbf(A, B, C)
obsvf(A, B, C)