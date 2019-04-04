% Dati
%   A (3x3)
%   B (3x1)
%   C (2x3)
%   D (?x?)
% Fare:
% - Rappresentazione state-space
% - Funzione di trasferimento
% - Risposta all'impulso
% - Risposta al gradino

% Pulisci
clear; clc

% Dati del problema
A = -[ rand 0 0; 0 rand 0; 0 0 rand ]; % Sistema stabile
B = rand(3, 1);
C = rand(2, 3);
D = rand(2, 1);

% Rappresentazione state-space
sistema = ss(A,B,C,D);

% Funzione di trasferimento
tf(sistema)

% Risposta a impulso e gradino
t = linspace(0, 20, 1000);

figure(1);
step(sistema, t);

figure(2);
impulse(sistema, t);
