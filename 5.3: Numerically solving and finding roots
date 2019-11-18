clear; close all; clc

%% Header

% Tamar Bacalu, Taylor Foster, Alexa Jakob (author)
% MA240E: Differential Equations
% Section 5.3 Question 25
% 
% Question consists of solving the IVP theta'' + sin(theta) = 0 subject to
% theta(0)=pi/12 and theta'(0)=-1/3

% Parts a-d done by hand
% Used documentation for ode45, legend, dsolve, and deval. Used MATLAB article
% "Solving Second Order Nonlinear ODEs Numerically": 
% https://www.mathworks.com/help/symbolic/solve-differential-equation-numerically-1.html

%% Part a: Solve the linear approximation
syms theta(t)
ode = diff(theta,2)+theta == 0;
thetaPrime = diff(theta);
conditions = [theta(0)==pi/12 thetaPrime(0)==-1/3];
linearApproxSolution = dsolve(ode, conditions)

%% Part b: Find the Taylor Polynomial

TaylorSeries = taylor(theta, 'Order', 4)

%% Part c: approximate t1 with the first two terms of the Taylor series
syms theta(t)
theta = pi/12 - 1/3*t;
t1_taylor2 = solve(theta)

%% Part d: approximate t1 with the first three terms

theta = theta -pi/24*t^2;
t1_taylor3 = solve(theta)

%% Part e: estimate root using the Taylor series polynomial

p = [-1/6 -pi/24 -1/3 pi/12]; %represents taylor series polynomial
roots = roots(p);
t1_estimated = roots(3) %choose the real root

%% Part f: Find the first root

% Equation cannot be solved analytically, need to use ode45 numerical
% solver, which doesn't accept symbolic input: create a vector field

syms theta(t)
[V] = odeToVectorField(diff(theta,2) + sin(theta) == 0);
M = matlabFunction(V, 'vars', {'t','Y'});
sol = ode45(M,[0 5],[pi/12 -1/3]);
sol.y(2,:)=[]; % remove second row of sol.y, as it doesn't meet initial conditions (ask about this)

X = linspace(0, 5);
Y = deval(sol, X);

hold on
plot(X,Y, 'DisplayName','thetaDouble+sin(theta)=0' )
plot(0, pi/12, 'b*', 'DisplayName','theta(0)=pi/12')
title('Numerically solve IVP')
legend('Location','north')

% Find root by finding the index of the values of Y that are closest to 0 (none will be
% exactly 0). Choose the first one since we're looking for the first time
% it crosses.
v = find(abs(Y)<1e-2);
plot(X(v(1)),Y(v(1)),'ro','DisplayName','t1')
hold off

%% Part g: Find the next two roots
% Need to extend the interval: redo for t in [0 10]
sol = ode45(M,[0 10],[pi/12 -1/3]);

sol.y(2,:)=[]; % remove second row of sol.y, as it doesn't meet initial conditions (ask about this)

X = linspace(0, 10,1000); % add more points to increase the likelihood of finding zeros
Y = deval(sol, X);

figure
hold on
plot(X,Y, 'DisplayName','thetaDouble+sin(theta)=0')
title('Numerically solve IVP')
legend('Location','southoutside')

w = find(abs(Y)<2e-3); % Found a small enough epsilon such that the roots are separated
t1_numerical = X(w(1))
t2_numerical = X(w(2))
t3_numerical = X(w(3))

plot(X(w(1)),Y(w(1)),'ro','DisplayName','t1')
plot(X(w(2)),Y(w(2)),'bo','DisplayName','t2')
plot(X(w(3)),Y(w(3)),'go','DisplayName','t3')
hold off
