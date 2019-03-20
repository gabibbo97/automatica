% Pulisci
clc
clear

% Definizione del sistema
A = [ -1  0; 0 -1 ]; % un polo in -1 non cont + un polo in -1 non oss
B = [  1; 1  ];
C = [  1  1 ];
D = 0;

sistema = ss(A, B, C, D);

% Controllabilita
decomposizioneKalmanControllabilita = ctrb(sistema);
rangoControllabilita = rank(decomposizioneKalmanControllabilita);
[ Ac, Bc, Cc ] = ctrbf(A, B, C);
sistemaDecompostoControllabile = ss(Ac, Bc, Cc, D);

% Osservabilita
decomposizioneKalmanOsservabilita = obsv(sistema);
rangoOsservabilita = rank(decomposizioneKalmanOsservabilita);
[ Ao, Bo, Co ] = obsvf(A, B, C);
sistemaDecompostoOsservabile = ss(Ao, Bo, Co, D);