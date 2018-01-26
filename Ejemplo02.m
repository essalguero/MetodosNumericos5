clear all
clc

deltaX = 0.05;
deltaT = 0.02;
T = 1;
xspan = [0, 1];
tspan = [0, T];

nstep = [1 / deltaX, T / deltaT];

% 0 = Euler Explicito
% 1/2 = Crank-Nicholson
theta = 0.5;
alpha = 1; % Coeficiente de difusion del material

%Situacion inicial
u0 = @(x) 0 * x;

% Contorno
g = @(x, t) x.^2 .* (x - 1);

% Forzamiento externo
f = @(x, t) 2 * t - x.^2 + 10 * x .* t;

# si es mayor que 1/2 indica que es inestable
coef_estab = alpha * (1 - 2 * theta) * deltaT / (deltaX^2)

[x, u] = heattheta(xspan, tspan, nstep, theta, alpha, u0, g, f)
plot(x, u);