% Joel Villarreal
% Math/CS 375
% Project 7 Problem 3(b)

%% Computing the Error of Composite Trapezoid Rule 
clear
clc

% assigning a and b (integral bounds)
a = 0;
b = pi;

% the function to integrate: f(x) = sin(x)
syms x
f = sin(x);

% The actual value of the definite integral
areaExact = int(f, x, [a b])

% An approximation with the Composite Trapezoid Rule and n = 161
n = 161;

h = (b - a) / n;

sum = 1/2 * (sin(a) + sin(b));
for i = 1: 1: n - 1 % interior nodes TODO check these are correct
    area_i = a + i * h;
    sum = sum + sin(area_i);
end
sum = sum * h

error = double(abs(sum - areaExact))