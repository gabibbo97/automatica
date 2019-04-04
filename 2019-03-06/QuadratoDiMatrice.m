% Quadrato di matrice a mano
% Pulizia ambiente
clc
clear

A = [1 2 3; 4 5 6; 7 8 9]; % Matrice di partenza

[nr, nc] = size(A);        % Dimensioni della matrice

% Dichiarazioni
B = [];
C = [];

for i=1:nr
  for j=1:nc
    % Stile MATLAB
    B(i,j) = A(i,:) * A(:,j); % Riga i-esima * colonna j-esima
    % Stile standard
    C(i,j) = 0;               % Inizializzazione nuova matrice
    for k=1:nc
      C(i,j) += A(i,k) * A(k,j); % Sommatoria prodotto riga / colonna
    endfor
  endfor
endfor

X = A*A % Risultato di MATLAB
B
C
