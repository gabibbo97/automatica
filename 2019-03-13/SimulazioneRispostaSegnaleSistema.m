% Pulizia ambiente
clear
% Pulizia console
clc

% Definizione parametri del sistema
A = -2 * [ rand 0; 0 rand ];
B = rand(2, 1);
C = rand(1, 2);
D = 0;

% Converto le matrici in un sistema
sistema = ss(A,B,C,D);

% Segnale in ingresso
t = linspace(0, 10, 1000);
u = sin(t);

[y,t,x] = lsim(sistema, u, t);

plot(t, y, t, x);
legend('Output', 'x1', 'x2');