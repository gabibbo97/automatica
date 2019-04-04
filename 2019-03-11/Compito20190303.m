% Pulizia ambiente
clear
% Pulizia console
clc
% Pulizia figure
clf

% Parametri
a = - 0.5;
u = 1;

punto_iniziale  = 0;
valore_iniziale = 0;
punto_finale    = 10;

% Spazio
x = linspace(punto_iniziale, punto_finale, 100);

%
% Funzione (x' = ax + u)
%   x(n + 1) - x(n) = a x(n) + u
%   x(n + 1) = x(n) ( a + 1 ) + u
%

% Step singolo
step = ( max(x) - min(x) ) / max(size(x));

f = [];
f(1) = valore_iniziale;
for i = 2:1:max(size(x))
  f(i) = f(i-1) + ( a * f(i - 1) + u ) * step;
endfor

% Plot

%% Funzione reale
prof = lsode(@(x, t) a * x + u, valore_iniziale, x);

%% Errore
error = abs(f - prof');
meanError = mean(error);
maxError = max(error);

plot (x, f, x, prof)
legend('My solution','Actual solution')
title('Approximation of d/dx = ax + u')

meanError
maxError