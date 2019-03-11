% Pulisci ambiente
clear
% Pulisci console
clc
% Pulisci grafici
clf

% Equazione: x' = ax + u
% Parametri
a = [ -0.5, -1, -2 ];
u = [    1,  1,  1 ];

% Spazio
x = linspace(0, 10, 1000);

% Calcolo delle funzioni
step = ( max(x) - min(x) ) / max(size(x));

legends = [];
for i = 1:1:max(size(a))
    f(i, 1) = 0;
    for j = 2:1:max(size(x))
        f(i, j) = f(i, j - 1) + ( a(i) * f(i,j - 1) + u(i) ) * step;
    end
    
    legends = [ legends; strcat( num2str(a(i)), "x + ", num2str(u(i)) ) ];
end
plot(x, f)
legend(legends);

