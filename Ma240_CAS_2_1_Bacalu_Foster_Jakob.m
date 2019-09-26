clear; close all; clc

%% Header
% Tamar Bacalu, Taylor Foster, and Alexa Jakob
% MA240E: Prof Smyth

% Chapter 2.1 Question 11
% The goal of this question was to use CAS software to generate a direction
% field for a differential equation. This was done using the dirfield
% function from the University of Maryland, available at 
% http://terpconnect.umd.edu/~petersd/246/matlabode.html. 


%% Plot
f = @(t,y) y-cos(t*(pi/2)); % define the function from question 11
dirfield(f,-pi:0.25:pi,-pi:0.25:pi) % use dirfield function to generate a
% direction field. Inputs are: function, start x:step:end x, start y:step:end y 
title('Direction field of dy/dx = y-cos(x*(pi/2))')
xlabel('x')
ylabel('y')