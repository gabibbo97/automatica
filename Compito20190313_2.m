% Dati
%   A = [ 0 1; -1 -2 ]
%   B = [   0;     1 ]
%   C = [ 3 1 ]
%   D = 0
%

% Pulizia
clear; clc

% Definizione del sistema
A = [ 0 1; -1 -2 ];
B = [   0;     1 ];
C = [ 3 1 ];
D = 0;

% Sistema in termini di state-space
sistema = ss(A, B, C, D);

% Funzione di trasferimento
trasferimento = tf(sistema);

% Zeri e poli della funzione di trasferimento
zeri = zero(trasferimento);
poli = pole(trasferimento);

% Funzione di trasferimento nuova
k = 1;
trasferimento2 = zpk(zeri, poli, k);

% Stampa delle funzioni
trasferimento
trasferimento2