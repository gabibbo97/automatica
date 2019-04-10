% Pulizia
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

% Controllo

poli_oss = [ -9 -5 -7 ];
poli_contr = [ -1 -2 -4 ];

H = place(A', C', poli_oss);
K = place(A, B, poli_contr);

A_aug = [A-B*K B*K; zeros(n,n) A-H*C];
B_aug = [B; zeros(n,1)];
C_aug = [C; zeros(1,n)];
D_aug = D;
sist_aug = ss(A_aug, B_aug, C_aug, D_aug);

t = [ 0:.01:100 ];
u = 0 * sin(t);

[ y, t, x_aug ] = lsim(sist_aug, u, t, [zeros(n,1); ones(n,1)]);
x_aug = x_aug';
figure(1); plot(t, x_aug(1:n,:));
figure(2); plot(t, x_aug(n+1:2*n,:));
