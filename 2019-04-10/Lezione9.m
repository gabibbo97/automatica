% Pulizia ambiente
clear
clc

% Definizione sistema
%% Funzioni di trasferimento
s = tf('s');
s1_tf = 1/s;
s2_tf = 1/(s-1);
s3_tf = 1/(s-2);

s1 = ss(s1_tf);
s2 = ss(s2_tf);
s3 = ss(s3_tf);

%% Connessione
s_serie = series(s1, s2);
s_totale = feedback(s_serie, s3);

A = s_totale.A;
B = s_totale.B;
C = s_totale.C;
D = s_totale.D;

p = [ -1 -2 -3 ]; % Poli desiderati

% Metodo del guadagno
k = place(A, B, k); % Calcolo del guadagno
nuova_a = A-B*k;
nuovo_sistema = ss(nuova_a, B, C, D);
eig(nuova_a)

% Metodo con l'osservatore
H = place(A', C', p);
H = H';
nuova_a_2 = A-H*C;
nuovo_sistema_2 = ss(nuova_a_2, B, C, D);
eig(nuova_a_2)
