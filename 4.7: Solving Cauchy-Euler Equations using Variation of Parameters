close all; clear all; clc

%% Header
% Tamar Bacalu, Taylor Foster, Alexa Jakob (author)
% MA240E: Differential Equations
% Section 4.7 Question 51
% 
% This was completed with help from the Matlab Solve, Simplify, Coeffs, int, 
% and diff documentation.


%% Solve associated homogeneous equation
syms y(x) m c1 c2 c3

% We guess yp = x^m

guessSol = x^m;
guessSolPrime = diff(guessSol,x);
guessSolDouble = diff(guessSol,x,2);
guessSolTriple = diff(guessSol,x,3);

aux = x^3*guessSolTriple-x^2*guessSolDouble-2*x*guessSolPrime+6*guessSol == 0;
aux = simplify(aux);
assocLhodeSol = solve(aux, m);

y1 = x^assocLhodeSol(1);
y2 = x^assocLhodeSol(2);
y3 = x^assocLhodeSol(3);

yc = c1*y1+c2*y2+c3*y3

%% Solve the LNODE using variation of parameters

% When using variation of parameters, we are looking for yp(x) such that
% yp(x) = u1*y1+u2*y2+u3*y3. We do that by finding the Wronskian and
% solving the system of linear equations in u1', u2' and u3' using Cramer's rule.

syms u1 u2 u3 g(x)

g(x) = x^2; % the inhomogeneity

% Calculate Wronskian matrix

W = [ y1        y2          y3;
    diff(y1)    diff(y2)    diff(y3);
    diff(y1,2)  diff(y2,2)  diff(y3,2)];

% Create three different matrices replacing column i with the solution
% vector [ 0 0 g(x)], to use Cramer's rule

u1Matrix = [
    0           y2          y3;
    0           diff(y2)    diff(y3);
    g(x)        diff(y2,2)  diff(y3,2)];

u2Matrix = [
    y1          0           y3;
    diff(y1)    0           diff(y3);
    diff(y1,2)  g(x)        diff(y3,2)];

u3Matrix = [
    y1          y2          0;
    diff(y1)    diff(y2)    0;
    diff(y1,2)  diff(y2,2)  g(x)];
    
u1 = int(det(u1Matrix)/det(W));
u2 = int(det(u2Matrix)/det(W));
u3 = int(det(u3Matrix)/det(W));

yp = u1*y1+u2*y2+u3*y3

%% General solution

y = yp + yc


