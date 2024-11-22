% Joel Villarreal
% Math/CS 375
% Project 7 Problem 2

% Linear Second Order Boundary Problem
% u′′(x) + P(x)u'(x) + Q(x)u = f(x), u(a) = α, u(b) = β
% (1 - 3/2 * h)u_(i-1) + (-2 + 2h^2)u_i + (1 + 3/2 * h)u_(i+1) = 4h^2 * 
% x_i^2

% u′′(x) + 3u′(x) + 2u(x) = 4x^2, u(1) = 1, u(2) = 6

% NOTE: u_exact(x) = 7 − 6x + 2x^2 + C1e^(−2x) + C2e^(−x)
% C1 = −e^3(2 + 3e) / e − 1
% C2 = 2e + 3e^3 / e − 1

%% Approximating u(x), and Comparing to Exact Value (with 10 and 40 pts)
clear
clc

% for (a) use N = 10, for (b) use N = 40
% N = 10; % (a)N = 10 -> 11 points, 10 subintervals
N = 40; % (b) N = 40 -> 41 points, 40 subintervals


% u(a) and u(b)
a = 1;
b = 2;

% Spacing and constants
h = (b - a) / N;

c1 = 1 - 3/2 * h;
c2 = -2 + 2 * h^2;
c3 = 1 + 3/2 * h;

% The diagonal matrix (N-1 x N-1)
v1 = c1 * ones(N - 2, 1);
v2 = c2 * ones(N - 1, 1);
v3 = c3 * ones(N - 2, 1);

A1 = diag(v1, -1);
A2 = diag(v2);
A3 = diag(v3, 1);
A = A1 + A2 + A3;

% The F vector
x = a : h : b;
x = x.^2;
x = x(2 : N);
x = x.';

alpha = 1;
beta = 6;

const = zeros(N-1, 1);
const(1) = (1 - 3/2 * h) * alpha;
const(N - 1) = (1 + 3/2 * h) * beta;
F = 4 * h^2 * x - const;

% Getting the u vector
u = A \ F;
u = [alpha u.' beta];
x = a : h : b;

% u exact
x_exact = a: h / 5 : b;
e = exp(1);

C1 = -(e^3 * (2 + 3 * e)) / (e - 1);
C2 = (2 * e + 3 * e^3) / (e - 1);

u_exact = zeros(size(x_exact));

for i = 1 : length(x_exact) 
    x_i = x_exact(i);
    u_exact(i) = 7 - 6 * x_i + 2 * x_i^2 + C1 * e^(-2 * x_i) + C2 * e^(-x_i);
end

% For (a)
% plot(x, u, 'r-o')
% title("u(x) Approximation, N = 10")
% legend("u(x)")

% For (b)
plot(x, u, 'r-o', x_exact, u_exact, 'b-')
title("u(x) Approximation vs. Exact Value, N = 40")
legend("approximation", "u(x)")