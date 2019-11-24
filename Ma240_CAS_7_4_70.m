clear; close all; clc

%% Header

% Tamar Bacalu, Taylor Foster, Alexa Jakob (author)
% MA240E: Differential Equations
% Section 7.4  Question 70

% The question consists of using the Laplace transform in Matlab to solve
% for the charge on a capacitor given by the differential equation q'' + q
% = 1 - 4U(t-pi)+6U(t-3pi). The equation is transformed into the Laplace
% domain, solved for L, and then the inverse transform is performed and the
% result q(t) is plotted.

%% Question

syms q(t) L

ode = diff(q(t),t,2)+q == 1 - 4*heaviside(t-pi)+6*heaviside(t-3*pi)

% Transform the equation into the Laplace domain
Transformed = laplace(ode);
Transformed = subs(Transformed, laplace(q(t)), L);

SolvedTransformed = solve(Transformed, L)
Inverse = ilaplace(SolvedTransformed);

% Make proper substitutions of initial conditions to be able to solve for s
Inverse = subs(Inverse, q(0), 0);
Inverse = subs(Inverse, subs(diff(q(t), t), t, 0), 0);

q(t) = Inverse

% Mark the points at which the unit step function goes from 0 to 1 - we will
% notice that each of the regions bounded by these points is a sinusoid.

xpoints = [pi 3*pi]
ypoints = [q(pi) q(3*pi)]

fplot(q)
hold on
plot(xpoints, ypoints, '*')
title('Solution to qDouble + q = 1 - 4U(t-pi)+6U(t-3pi)')
xlabel('time t (seconds)')
ylabel('Charge on capacitor, q (Coulombs)')
axis([0 30 -10 10]) 

% I chose this interval b/c I wanted to see if the system ever reached 
% a steady state and what that might look like. 
% It reaches a sinusoidal steady state (which can be predicted
% by looking at the form of the solution - a sum of cosines. 