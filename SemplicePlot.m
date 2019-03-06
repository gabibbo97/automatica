% Pulizia ambiente
clear
% Pulizia console
clc
% Pulizia figure
clf

% Impostazione dell'intervallo
x = -1:.1:1

% Funzioni
u = x.^2
v = x.^3
w = sin(x)

% Modalitá 1: HOLD ON
figure(1) % Prima finestra di disegno
hold on % Attiva HOLD
plot(x, u, 'r')
plot(x, v, 'g')
plot(x, w, 'b')
hold off

% Modalitá 2: MULTIPLOT
figure(2) % Seconda finestra di disegno
plot(x, u, 'r', x, v, 'g', x, w, 'b')
legend('x²','x³','sin(x)')
xlabel('Asse X')
ylabel('Asse Y')

% Modalitá 3: Linspace
figure(3) % Terza finestra di disegno
t = linspace(0, 10, 1000); % Genera un intervallo [-1, 1] con all'interno 1000 elementi
                             % Numero di punti aggiunti: 1000 - 2 = 998
                             % Numero di intervalli: 1000 - 1 = 999
func = [ sin(t); cos(t); exp(-t) ]
plot(t, func)
legend('sin(t)','cos(t)','e^-t')