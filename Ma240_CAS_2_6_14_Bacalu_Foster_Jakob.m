close all; clear all; clc

%% Header
% Tamar Bacalu, Taylor Foster, Alexa Jakob (author)
% MA240E: Differential Equations
% Section 2.6 Question 14, Parts a-c.

% Thank you to Jack Langner for suggesting a new approach to finding the
% critical points in part c. The Matlab online documentation was also very
% helpful for finding new functions and learning syntax.

%% Part a

% Solve the differential equation using the Matlab ode45 solver, then graph
% its solution using the RK4 method

% Numerically solve the differential equation
figure
h = 0.01;
x = 0:h:10;
y0 = 0;
f = @(x,y) -2*x*y+1;
[x,y] = ode45(f, x, y0);

plot(x,y,'r')
hold on;

% Now solve using the RK4 method

y1=NaN(length(x),1);
y1(1)=0; %Initial condition
%
for ii = 1:length(x)-1
    k1 = f(x(ii),y1(ii));
    k2 = f(x(ii)+h/2,y1(ii)+h*k1/2);
    k3 = f(x(ii)+h/2,y1(ii)+h*k2/2);
    k4 = f(x(ii)+h,y1(ii)+h*k3);
    y1(ii+1) = y1(ii)+(h/6)*(k1+(2*k2)+(2*k3)+k4);
end

plot(x,y1,'b')
hold off
legend('Solution to y=2xy+1', 'Runge-Kutta approximation', 'Location', 'northeast');
%% Part b

% Solved by hand: we obtain y = e^-x^2*sqrt(pi)/2*erf(x)+c

%% Part c

% Graph the analytic solution, which I solved by hand
n = 3;
x = -n:0.001:n;
y = sqrt(pi)*erfi(x)./(2*exp(x.^2));

% We can approximate the derivative by taking the difference in y over the
% difference in x
yp = (y(2:end)-y(1:end-1))./(x(2:end)-x(1:end-1));

% Find relative extrema by taking the absolute value of all derivatives and
% choosing the ones smaller than an epsilon. This returns the indices at
% which the smallest derivatives are.
v = find(abs(yp)<1e-3);

figure
plot(x,y)
hold on;
plot([-n n], [y(v(1)) y(v(2))], 'r')
plot([-n n], [y(v(3)) y(v(4))], 'b')
legend('Analytic solution to y=-2xy+1', 'Minimum', 'Maximum', 'Location', 'southeast')

% Coordinates of the relative extrema

x_min = x(v(1)) 
x_max = x(v(3))
y_min = y(v(1))
y_max = y(v(3))

% Note that the function is even so it possesses symmetry around the
% origin, such that x_min = -x_max and y_min = -y_max.