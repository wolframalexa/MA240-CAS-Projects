clear; close all; clc

%% Header
% Tamar Bacalu, Taylor Foster, Alexa Jakob
% MA240E: Differential Equations
% Section 2.2 Question 60, Parts a-c.
% The goal of this question is to use CAS software (here, Matlab) to graph
% the solutions of the ODE, including several intial value problems.
% We want to acknowledge Jack Langner for his help in explaining Matlab
% commands and helping debug the code.

%% Part a
[X,Y]=meshgrid(-10:0.01:10);
% Solved separable differential equation by hand, set equal to z:
z = -1/3*Y.^3+Y.^2+1/2*X.^2-1/3*X.^3;
% These vectors contain the constants c for the level curves z(x,y)=c.
a = [200 100 50 10 5];
b = [a -a -1 -0.75 -1.375 -0.15 0.75 0.15 1];
figure
contour(X,Y,z,b) % plots level curves at the specified levels in b
title('Level Curves for Question 2.2.60a')
ylabel('y')
xlabel('x')

%% Part b
[X,Y]=meshgrid(-5:0.01:5);

% Input initial value by hand, y(0)=3/2, so c = -9/8
f =-1/3*Y.^3+Y.^2+1/2*X.^2-1/3*X.^3-9/8;

% Set dx/dy=0 to find vertical tangents, which are present at y = 0 and y =
% 2. We want to find their x values, so we use a root finder.
roots_vector = roots([-1/3 1/2 0 -9/8]);
roots_vector2 = roots([-1/3 1/2 0 -9/8-8/3+4]);

% Graph the level curve with f = 0
figure
contour(X,Y,f,[0 0]);
hold on
plot(0, 3/2, 'ro');


% Plot only the portion of phi on the largest interval
x_phi = linspace(roots_vector(3), roots_vector2(1))';
y_phi = NaN(3,length(x_phi)); % forces size of y_phi for easier plotting later on.
% both matrices will be transposed so that they can be graphed more easily
% (as we want y_phi to have 3 columns, not rows

for ii = 1:length(x_phi)
y_phi(:,ii) = roots([1/3 -1 0 9/8+(x_phi(ii)^3/3)-(x_phi(ii)^2/2)]);
end
y_phi = y_phi.';
plot(real(x_phi),real(y_phi(:,2)), 'r') 
% plotted second column of y as those are the real roots
plot([roots_vector(3) roots_vector(3)], [0, -5], '--')
plot([roots_vector2(1) roots_vector2(1)], [2, -5], '--')

title('Solution curve where y(0)=3/2, Question 2.2.60b')
ylabel('y')
xlabel('x')
legend('Level curve c = -9/8','initial condition', 'Largest interval of solution',...
    'Location', 'southwest');

%% Part c
% Same as part b above. Input initial value by hand, y(0)=-2 so c = -20/3
f =-1/3*Y.^3+Y.^2+1/2*X.^2-1/3*X.^3-20/3;

% Set dx/dy=0 to find vertical tangents, which are present at y = 0 and y =
% 2. We want to find their x values, so we use a root finder. In this case,
% the largest interval is from approximately -2 to infinity.
roots_vector2 = roots([-1/3 1/2 0 -28/3+4]);

% Graph the level curve with f = 0
figure
contour(X,Y,f,[0 0]);
hold on
plot(0, -2, 'ro');


% Plot only the portion of phi on the largest interval
x_phi = linspace(roots_vector2(3), 5)';
y_phi = NaN(3,length(x_phi));

for ii = 1:length(x_phi)
y_phi(:,ii) = roots([1/3 -1 0 20/3+(x_phi(ii)^3/3)-(x_phi(ii)^2/2)]);
end
y_phi = y_phi.';
plot(real(x_phi),real(y_phi(:,3)), 'r')
plot([roots_vector2(3) roots_vector2(3)], [2, -5], '--')

title('Solution curve where y(0)=-2, Question 2.2.60c')
ylabel('y')
xlabel('x')
legend('Level curve c = -20/3','initial condition', 'Largest interval of solution',...
    'Location', 'southwest');