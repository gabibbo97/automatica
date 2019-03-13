% Pulizia ambiente e console
clear; clc;

% Definizione matrice
A = [1 2; 3 4];

% Autovalori
eig(A)

% Coefficienti del polinomio caratteristico
% [ 1 -5 -2 ] => s^2 - 5s - 2
poly(A)

% Radici del polinomio caratteristico
roots(poly(A))

% Coefficienti del polinomio minimo
minpoly(A)

% Radici del polinomio minimo
roots(minpoly(A))

% Matrice identica 2x2
I = eye(2);

% Controllo di stabilitá di MATLAB
A = [1 0; 0 1]; B = [0; 1]; C = [0, 0], D = 1;
sistema = ss(A, B, C, D);
isstable(sistema)

% Funzione di trasferimento
tf(sistema)

% Controllo da definizioni della stabilitá di un sistema
A = [0 1; 0 0]; B = [0; 1]; C = [1, 0], D = 0;
poli = eig(A);
poliMin = roots(minpoly(A));
