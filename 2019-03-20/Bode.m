% Pulizia
clear
clc

% Definizione di S
s = tf('s');

% Definizione del sistema
sistema = 1/(s+1);
%sistema_zpk = zpk([], [-3 -2], 1);

% Bode
figure(1);
bode(sistema);
[ ampiezza, fase, omega ] = bode(sistema);

% Simulazione risposta
t = linspace(0, 20, 1000);
u = sin(t);

figure(2);
% Per la fase faccio omega * delta t tra ingresso e uscita
lsim(sistema, u, t);