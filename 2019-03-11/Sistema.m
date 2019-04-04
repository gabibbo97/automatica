% Pulisci la workspace
clear
% Pulisci la console
clc
% Pulisci i grafici
clf

A = -2 * [ rand() 0; 0 rand(); ];
B = rand(2,1);
C = rand(1,2);

% X' = Ax + Bu
% Y  = Cx

% x(t+1) - x(t) / delta = A x(t) + B u(t)
% x(t+1) = x(t) + (A x(t) + B u(t)) * delta
% y = C x(t)

t = linspace(0, 50, 1000);
u = sin(t);

x = rand(2,1);
y(1) = C * x;
delta = ( max(t) - min(t) ) / max(size(t));
for i = 2:1:max(size(t))
    x(:, i) = x(:, i - 1) + ( A * x(:, i - 1) + B * u(i - 1) ) * delta;
    y(i) = C * x(:, i);
end

plot(t, x, t, y)
legend('x', 'y')