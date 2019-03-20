% Funzioni per la connessione di sistemi
%
%   series   Connette due sistemi in serie
%   parallel Connette due sistemi in parallelo
%   feedback Connette due sistemi in retroazione
%   connect  Connette due sistemi, va fornito il tipo di connessione
%
%   sumblock Connette due sistemi a un nodo sommatore
%

% Pulizia
clear
clc

% Sistemi
sistema_1_tf = tf([1 1], [1 0 1]);
sistema_1 = ss(sistema_1_tf);
sistema_2_tf = tf(  [1],   [1 1]);
sistema_2 = ss(sistema_2_tf);

% In serie
sistemi_in_serie = series(sistema_1, sistema_2);
sistemi_in_serie_tf = minreal(series(sistema_1_tf, sistema_2_tf)); % Potrebbero esserci cancellazioni, quindi minreal

% In parallelo
sistemi_in_parallelo = parallel(sistema_1, sistema_2);

% In retroazione
sistemi_in_retroazione = feedback(sistema_1, sistema_2);

% Funzione connect
%
% --u1--[ S1 ]--y1 = u2 = y--[ S2 ]--y2---
% Per la connessione y1 = u2
%
sistema_1.InputName  = 'u1';
sistema_1.OutputName = 'y';
sistema_2.InputName  = 'y';
sistema_2.OutputName = 'y2';
sistemi_in_serie_connect = connect(sistema_1, sistema_2,'u1','y2');
rangoControllabilitaSerie = rank(ctrb(sistemi_in_serie_connect));
rangoOsservabilitaSerie   = rank(obsv(sistemi_in_serie_connect));

% Funzione sumblock
sommati = sumblk('e = y + y2');