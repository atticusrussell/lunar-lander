% Using MATLAB Functions
% Hyperbolic sine
clc

% Get user input for x
x=input('Enter value of x: ');

% Calculate hyperbolic sine 
% Definiton of sinh x
y1=(exp(x)-exp(-x))/2;
% MATLAB sinh(x) function
y2=sinh(x);
% Percent difference
pcterr = (y1-y2)/y1 *100;

% Output results
disp('The definition of sinh x gives:')
disp(y1)
disp('The MTALAB function sinh(x) gives:')
disp(y2)
disp('The percent error between the two is:')
disp(pcterr)
