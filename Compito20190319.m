% Ho una matrice fatta cosí
%
%     [ 0   |    I(n-1)    ]     [ 0 ]
% x = [ 0   |    I(n-1)    ] x + [ 0 ] u
%     [ -a0  -a1 ... -An-1 ]     [ 1 ]
%
% y = [ b0 ... Bn-1 ] x
%

% Pulizia ambiente
clear
clc

% Ordine del sistema
n = 3;

% Zeri e poli
% Sist. proprio deg(Numeratore) < deg(Denominatore)
z = [ -1 -10 ];
p = [ -10 -20 -50 ];

num = poly(z); % polinomio degli zeri
den = poly(p); % polinomio dei poli
flipDen = flip(den);
flipDen = flipDen(1:n); % Elido il primo coeff.

% Sistema
A = zeros(n, n); % Preallocazione di A

for i = 1:1:n
    for j = 1:1:n
        if j == 0
            A(i,j) = 0;
        elseif and(i < n, i == j)
            A(i,j) = 1;
        elseif i == n
            A(i,j) = -1 * flipDen(j);
        else
            A(i,j) = 0;
        end
    end
end
A = [ 0 1 0; 0 0 1; -1 * flip(den(1:n)) ];

% B = colonna con come ultimo 1
B = zeros(n,1); % Preallocazione della B
for i = 1:1:n
    if i < n
        B(i,1) = 0;
    else
        B(i,1) = 1;
    end
end

% C = coefficienti del numeratore, zero-padded da destra
C = zeros(1,n); % Preallocazione della C
flipNum = flip(num);
for i = 1:1:n
    if i > max(size(num))
        % Completa le Bn che non abbiamo
        C(i) = 0;
    else
        % Prendi le Bn dal numeratore girato
        C(i) = flipNum(i);
    end
end

% Deve essere == n
rangoControllabilita = rank(ctrb(A, B))

% Deve essere <= n
rangoOsservabilita = rank(obsv(A, C))

% Ottieni il sistema
sist_ss = ss(A, B, C, 0);
sist_tf = tf(sist_ss);
sist_zpk = zpk(sist_tf)

% Realizzazione minima
% Il secondo parametro é la tolleranza sul calcolo numerico
sist_minimal_zpk = minreal(sist_zpk, 1e-10);