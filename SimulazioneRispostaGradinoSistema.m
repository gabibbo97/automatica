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

% Calcolo della risposta al gradino con i parametri default
figure(1);
[y1, t1, x1 ] = step(sistema);
plot(t1, x1, t1, y1);
legend('x1', 'x2', 'Output');

% Calcolo della risposta al gradino con parametri personalizzati
figure(2);
t2 = linspace(0, 10, 1000);
[y2,t2,x2] = step(sistema, t2);
plot(t2, x2, t2, y2);
legend('x1', 'x2','Output');

% Calcolo della risposta al gradino automatica
figure(3);
step(sistema);