% Pulizia ambiente
clear
clc
clf

% Impostazione spazi
x = linspace(0, 10, 1000);
y = linspace(0, 10, 1000);
z = sin((x.^2 + y.^2)/10)

% Plot 3D
plot3(x, y, z)
grid % Aggiunge la griglia
