% Pulisci
clc
clear

% Definizione del sistema
A = [ 
      -1 0  0  0;
       0 0 -1  0;
       0 1  0  0;
       0 0  0 -2
    ];
B = [ 0; 1; 0; 0 ];
C = [ 1 1 1 1 ];
D = 0;

% Trovare
%
%   Poli controllabili
%   Poli osservabili
%   Polinomio caratteristico di controllo
%

sistema = ss(A, B, C, D);

% Grado del sistema
grado = max(size(A));

% Conto i poli controllabili / osservabili
rangoControllabilita = rank(ctrb(sistema));
rangoOsservabilita   = rank(obsv(sistema));

% Ottengo la decomposizione
[Ac, Bc, Cc] = ctrbf(A, B, C);
if rangoControllabilita < grado
    % Ho rango - rangoControllabilitá poli non controllabili
    dimNonControllabili = grado - rangoControllabilita;
    % La sottomatrice in alto a sx é non controllabile
    AnonCont = Ac(1:dimNonControllabili, 1:dimNonControllabili);
    % Prendo gli autovalori della matrice non osservabile
    poliNonControllabili = eig(AnonCont)
    % Tutti i poli meno quelli non controllabili sono i poli controllabili
    poliControllabili = setdiff(eig(Ac), poliNonControllabili)
else
    % Tutti i poli sono controllabili
    poliNonControllabili = []
    poliControllabili = eig(Ac)
end

[Ao, Bo, Co] = obsvf(A, B, C);
if rangoOsservabilita < grado
    dimNonOsservabili = grado - rangoOsservabilita;
    AnonOss = Ac(1:dimNonOsservabili, 1:dimNonOsservabili);
    poliNonOsservabili = eig(AnonOss)
    poliOsservabili = setdiff(eig(Ao), poliNonOsservabili)
else
    poliNonOsservabili = []
    poliOsservabili = eig(Ao)
end
