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

% Calcolo della risposta all'impulso con i parametri default
figure(1);
[y1, t1, x1 ] = impulse(sistema);
plot(t1, x1, t1, y1);
legend('x1', 'x2', 'Output');

% Plot della risposta all'impulso e al gradino
figure(2);
hold on;
t = linspace(0, 10, 1000);
[yi, ti, xi] = impulse(sistema, t);
[ys, ts, xs] = step(sistema, t);
plot (ti, yi, ts, ys, ti, xi, ts, xs);
legend('Uscita (impulso)', 'Uscita (gradino)', 'x1 (impulso)', 'x2 (impulso)', 'x1 (gradino)', 'x2 (gradino)')
hold off;