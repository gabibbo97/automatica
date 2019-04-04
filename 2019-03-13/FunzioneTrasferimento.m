% Pulizia
clear; clc
% Rappresentazione di
%        (s+3)
%   k -----------
%     (s-1)(s²+4)
z = [-3];
p = [1, 2i, -2i];
k = 1;
funzione = zpk(z, p, k);

% Zeri e poli della funzione
zero(funzione)
pole(funzione)